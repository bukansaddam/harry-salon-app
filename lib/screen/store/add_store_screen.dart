import 'dart:io';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';

class AddStoreScreen extends StatefulWidget {
  const AddStoreScreen({super.key});

  @override
  State<AddStoreScreen> createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _openController = TextEditingController();
  final _closeController = TextEditingController();
  final _descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late StoreProvider _imagesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imagesProvider = Provider.of<StoreProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _imagesProvider.clearImage();
    _nameController.dispose();
    _addressController.dispose();
    _openController.dispose();
    _closeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  hintText: 'Input store name here',
                  labelText: 'Name',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Input store address here',
                  labelText: 'Address',
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Open',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          InkWell(
                            onTap: () async {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          DateTime.now()))
                                  .then((timeOpen) {
                                if (mounted && timeOpen != null) {
                                  _openController.text =
                                      timeOpen.format(context);
                                }
                              });
                            },
                            child: CustomTextField(
                              controller: _openController,
                              hintText: 'Choose Time',
                              labelText: 'Time',
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Close',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          InkWell(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          DateTime.now()))
                                  .then((timeClose) {
                                if (mounted && timeClose != null) {
                                  _closeController.text =
                                      timeClose.format(context);
                                }
                              });
                            },
                            child: CustomTextField(
                              controller: _closeController,
                              hintText: 'Choose Time',
                              labelText: 'Time',
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
                  hintText: 'Input store description here',
                  minLines: 4,
                  labelText: 'Description',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    'Services not added yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                CustomButton(
                  function: () {},
                  text: 'Add Store',
                  width: 140,
                  height: 30,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Employees',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    'Employees not added yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                CustomButton(
                  function: () {},
                  text: 'Add Employees',
                  width: 185,
                  height: 30,
                ),
                const SizedBox(height: 60),
                context.watch<StoreProvider>().loadingState.when(
                      initial: () =>
                          CustomButton(function: _onSubmit, text: 'Submit'),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: () =>
                          CustomButton(function: _onSubmit, text: 'Submit'),
                      error: (message) =>
                          CustomButton(function: _onSubmit, text: 'Submit'),
                    ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    if (formKey.currentState!.validate()) {
      final provider = context.read<StoreProvider>();

      final name = _nameController.text;
      final address = _addressController.text;
      final open = _openController.text;
      final close = _closeController.text;
      final description = _descriptionController.text;

      if (provider.imageUrls.isEmpty) {
        _showMessage(context, 'Please add image');
      } else {
        await provider.addStore(
          name,
          description,
          address,
          0.0,
          0.0,
          TimeOfDay(
            hour: int.parse(open.split(':')[0]),
            minute: int.parse(open.split(':')[1]),
          ),
          TimeOfDay(
            hour: int.parse(close.split(':')[0]),
            minute: int.parse(close.split(':')[1]),
          ),
        );
        if (mounted) {
          if (provider.uploadResponse!.success) {
            context.read<StoreProvider>().refreshStore();
            _showMessage(context, provider.uploadResponse!.message);
            context.pop();
          } else {
            _showMessage(context, provider.uploadResponse!.message);
          }
        }
      }
    }
  }

  Widget _buildImage(BuildContext context) {
    final provider = context.watch<StoreProvider>();
    return provider.imageUrls.isNotEmpty
        ? SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.imageUrls.length + 1,
              itemBuilder: (context, index) {
                if (index == provider.imageUrls.length) {
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
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
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
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.removeImage(index);
                                    Navigator.pop(context);
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
                        child: Image.file(
                          File(provider.imageUrls[index]),
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
                  _onCameraView(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  _onGalleryView(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onCameraView(BuildContext context) async {
    final provider = context.read<StoreProvider>();

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
      _showMessage(context, 'Image added');
    }
  }

  void _onGalleryView(BuildContext context) async {
    final provider = context.read<StoreProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      if (provider.imageUrls.isNotEmpty) {
        provider.addImages(pickedFiles);
      } else {
        provider.setImages(pickedFiles);
      }
      _showMessage(context, 'Image added');
    }

    if (mounted) {
      context.pop();
    }
  }

  void _showMessage(BuildContext context, String message) {
    DelightToastBar(
      autoDismiss: true,
      builder: (context) => ToastCard(
        leading: const Icon(Icons.ac_unit_rounded),
        title: Text(message),
      ),
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(seconds: 3),
    ).show(context);
  }
}
