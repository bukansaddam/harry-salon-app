import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/detail_hairstyle.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class EditHairstyleScreen extends StatefulWidget {
  const EditHairstyleScreen({super.key, required this.detailHairstyle});

  final DetailHairstyle? detailHairstyle;

  @override
  State<EditHairstyleScreen> createState() => _EditHairstyleScreenState();
}

class _EditHairstyleScreenState extends State<EditHairstyleScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late HairstyleProvider _hairstyleProvider;

  @override
  void didChangeDependencies() {
    _hairstyleProvider = Provider.of<HairstyleProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    if (widget.detailHairstyle != null) {
      _nameController.text = widget.detailHairstyle!.name;
      _descriptionController.text = widget.detailHairstyle!.description;
    }

    Future.microtask(() {
      _hairstyleProvider.addExistingImage(widget.detailHairstyle!);
      _hairstyleProvider.combineImages();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _hairstyleProvider.clearImage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Hairstyle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Image',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                _buildImage(context),
                const SizedBox(height: 12),
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Input hairstyle name here',
                  labelText: 'Name',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _descriptionController,
                  hintText: 'Input hairstyle description here',
                  labelText: 'Description',
                ),
                const SizedBox(height: 60),
                context.watch<HairstyleProvider>().loadingState.when(
                      initial: () => CustomButton(
                        function: _onSubmit,
                        text: 'Submit',
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: () => CustomButton(
                        function: _onSubmit,
                        text: 'Submit',
                      ),
                      error: (message) => CustomButton(
                        function: _onSubmit,
                        text: 'Submit',
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<HairstyleProvider>();

      final name = _nameController.text;
      final description = _descriptionController.text;

      if (provider.imageUrls.isEmpty && provider.existingImages.isEmpty) {
        ToastMessage.show(context, 'Please add image');
      } else {
        await provider
            .updateHairstyle(
                id: widget.detailHairstyle!.id,
                name: name,
                description: description)
            .then((value) {
          if (provider.uploadResponse!.success) {
            ToastMessage.show(context, provider.uploadResponse!.message);
            context.pop();
          } else {
            ToastMessage.show(context, provider.uploadResponse!.message);
          }
        }).catchError((e) {
          ToastMessage.show(context, e.toString());
        });
      }
    }
  }

  Widget _buildImage(BuildContext context) {
    final provider = context.watch<HairstyleProvider>();
    return provider.combinedImages.isNotEmpty
        ? SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.combinedImages.length + 1,
              itemBuilder: (context, index) {
                if (index == provider.combinedImages.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        _buildBottomSheet(context);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                } else {
                  final isProviderImage =
                      provider.combinedImages[index]['isProvider'] as bool;
                  final imageUrl =
                      provider.combinedImages[index]['url'] as String;
                  final imageId =
                      provider.combinedImages[index]['id'] as String?;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        ToastMessage.show(
                            context, 'Long press to delete image');
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text('Delete Image'),
                              content: const Text(
                                  'Are you sure want to delete this image?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (isProviderImage) {
                                      provider.removeImage(index -
                                          provider.existingImages.length);
                                    } else {
                                      provider.deleteExistingImage(imageId!);
                                      debugPrint(
                                          'Deleted: ${provider.deletedImages}');
                                    }
                                    provider.combineImages();
                                    context.pop();
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: isProviderImage
                            ? Image.file(
                                File(imageUrl),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        : InkWell(
            onTap: () {
              _buildBottomSheet(context);
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          );
  }

  Future<void> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  'Add Image',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  _onCameraView();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  _onGalleryView();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onCameraView() async {
    final provider = context.read<HairstyleProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (!mounted) return;
      if (provider.imageUrls.isNotEmpty) {
        provider.addImage(pickedFile);
      }
      provider.setImages([pickedFile]);
      ToastMessage.show(context, 'Image added');
      provider.combineImages();
    }
  }

  void _onGalleryView() async {
    final provider = context.read<HairstyleProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty && mounted) {
      if (provider.imageUrls.isNotEmpty) {
        provider.addImages(pickedFiles);
      } else {
        provider.setImages(pickedFiles);
      }
      ToastMessage.show(context, 'Image added');
      provider.combineImages();
    }

    if (mounted) {
      context.pop();
    }
  }
}
