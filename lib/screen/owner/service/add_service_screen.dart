import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _durationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late ServiceProvider _serviceProvider;

  @override
  void didChangeDependencies() {
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _serviceProvider.clearImage();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Service'),
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
                  hintText: 'Input service name here',
                  labelText: 'Name',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _priceController,
                  hintText: 'Input service price here',
                  labelText: 'Price',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Duration (minutes)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _durationController,
                  hintText: 'Input service duration here',
                  labelText: 'Duration',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 60),
                context.watch<ServiceProvider>().loadingState.when(
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

  Widget _buildImage(BuildContext context) {
    final provider = context.watch<ServiceProvider>();
    return provider.imageUrl != null
        ? Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('Delete Image'),
                      content:
                          const Text('Are you sure want to delete this image?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            provider.clearImage();
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
                child: Image.file(
                  File(provider.imageUrl!),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
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
    final provider = context.read<ServiceProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (!mounted) return;
      provider.setImage(pickedFile);
      ToastMessage.show(context, 'Image added');
    }
  }

  void _onGalleryView() async {
    final provider = context.read<ServiceProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null && mounted) {
      provider.setImage(pickedFile);
      ToastMessage.show(context, 'Image added');
    }

    if (mounted) {
      context.pop();
    }
  }

  void _onSubmit() async {
    final provider = context.read<ServiceProvider>();
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final price = _priceController.text;
      final duration = _durationController.text;
      final storeId = widget.storeId;

      await provider.createService(
        name: name,
        price: price,
        duration: duration,
        storeId: storeId,
      );

      if (mounted) {
        if (provider.uploadResponse!.success) {
          provider.refreshService(storeId: storeId);
          context.pop();
          ToastMessage.show(context, 'Service added');
        } else {
          ToastMessage.show(context, provider.uploadResponse!.message);
        }
      }
    }
  }
}
