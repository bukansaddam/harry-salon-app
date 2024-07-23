import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class AddCommodityScreen extends StatefulWidget {
  const AddCommodityScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<AddCommodityScreen> createState() => _AddCommodityScreenState();
}

class _AddCommodityScreenState extends State<AddCommodityScreen> {
  final _nameController = TextEditingController();
  final _stockController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late CommodityProvider _commodityProvider;

  List<String> category = ['Hair Care', 'Hair Styling'];

  String selectedCategory = '';

  @override
  void initState() {
    selectedCategory = category.first;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _commodityProvider = Provider.of<CommodityProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _stockController.dispose();
    _commodityProvider.clearImage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Commodity'),
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
                _buildImage(),
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
                  hintText: 'Input commodity name here',
                  labelText: 'Name',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCategory.isNotEmpty
                        ? selectedCategory
                        : category.first,
                    underline: const SizedBox(),
                    items: category.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                      context.read<CommodityProvider>().refreshCommodity(
                            storeId: widget.storeId,
                            category: selectedCategory,
                          );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Stock',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _stockController,
                  hintText: 'Input commodity stock here',
                  labelText: 'Stock',
                ),
                const SizedBox(height: 60),
                context.watch<CommodityProvider>().loadingState.when(
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

  Widget _buildImage() {
    final provider = context.watch<CommodityProvider>();
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
    final provider = context.read<CommodityProvider>();

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
    final provider = context.read<CommodityProvider>();

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
    final provider = context.read<CommodityProvider>();
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final stock = _stockController.text;
      final storeId = widget.storeId;

      await provider
          .createCommodity(
        storeId: storeId,
        name: name,
        stock: stock.toString(),
        category: selectedCategory,
      )
          .then((_) {
        if (provider.uploadResponse!.success) {
          provider.refreshCommodity(storeId: storeId);
          context.pop();
          ToastMessage.show(context, 'Service added');
        } else {
          ToastMessage.show(context, provider.uploadResponse!.message);
        }
      }).catchError((error) {
        ToastMessage.show(context, error.toString());
      });
    }
  }
}
