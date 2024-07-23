import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class EditStoreScreen extends StatefulWidget {
  const EditStoreScreen(
      {super.key, required this.storeId, required this.detailStore});

  final String storeId;
  final DetailStore detailStore;

  @override
  State<EditStoreScreen> createState() => _EditStoreScreenState();
}

class _EditStoreScreenState extends State<EditStoreScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _openController = TextEditingController();
  final _closeController = TextEditingController();
  final _descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late StoreProvider _storeProvider;

  LatLng? locationData;
  LatLng currentLocation = const LatLng(0, 0);

  geo.Placemark? placemark;

  // List<Map<String, dynamic>> combinedImages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _storeProvider = context.read<StoreProvider>();

    _nameController.text = widget.detailStore.name;
    _addressController.text = widget.detailStore.location;
    _openController.text = widget.detailStore.openAt;
    _closeController.text = widget.detailStore.closeAt;
    _descriptionController.text = widget.detailStore.description;
  }

  @override
  void initState() {
    super.initState();

    getLocation();

    Future.microtask(() {
      _storeProvider.addExistingImage(widget.detailStore);
      _storeProvider.combineImages();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _storeProvider.clearImage();
    });
    _nameController.dispose();
    _addressController.dispose();
    _openController.dispose();
    _closeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void getLocation() async {
    try {
      locationData =
          LatLng(widget.detailStore.latitude, widget.detailStore.longitude);
      currentLocation = locationData!;

      final placemarks = await geo.placemarkFromCoordinates(
        widget.detailStore.latitude,
        widget.detailStore.longitude,
      );
      placemark = placemarks.first;
    } catch (e) {
      // Handle the error or show an error message to the user
      debugPrint("Error retrieving location: $e");
      // Optionally, set a default location or take other appropriate action
    }
  }

  // void updateCombinedImages() {
  //   final provider = _storeProvider!;
  //   final List<Map<String, dynamic>> modifiableStoreImages =
  //       widget.detailStore.images
  //           .map((image) => {
  //                 'isProvider': false,
  //                 'url': "${ApiService.baseUrl}/${image.image}",
  //                 'id': image.id
  //               })
  //           .toList();

  //   setState(() {
  //     combinedImages = [
  //       ...modifiableStoreImages,
  //       ...provider.imageUrls.map(
  //         (url) => {'isProvider': true, 'url': url},
  //       ),
  //     ];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Store'),
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
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _addressController,
                        hintText: 'Input store address here',
                        labelText: 'Address',
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      margin: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          final result = await context.pushNamed('maps',
                              extra: LatLng(currentLocation.latitude,
                                  currentLocation.longitude));

                          if (result is LatLng) {
                            setState(() {
                              locationData = result;
                            });

                            try {
                              final placemarks =
                                  await geo.placemarkFromCoordinates(
                                locationData!.latitude,
                                locationData!.longitude,
                              );

                              if (placemarks.isNotEmpty) {
                                setState(() {
                                  placemark = placemarks.first;
                                  _addressController.text =
                                      '${placemark!.name}, ${placemark!.subLocality}, ${placemark!.locality}, ${placemark!.country}';
                                });
                              }
                            } catch (e) {
                              debugPrint('Error fetching placemark: $e');
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.map_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
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

      if (provider.imageUrls.isEmpty && provider.existingImages.isEmpty) {
        ToastMessage.show(context, 'Image cannot be empty');
      } else {
        await provider.updateStore(
          id: widget.detailStore.id,
          name: name,
          description: description,
          location: address,
          latitude: locationData!.latitude,
          longitude: locationData!.longitude,
          openAt: TimeOfDay(
            hour: int.parse(open.split(':')[0]),
            minute: int.parse(open.split(':')[1]),
          ),
          closeAt: TimeOfDay(
            hour: int.parse(close.split(':')[0]),
            minute: int.parse(close.split(':')[1]),
          ),
        );
        if (mounted) {
          if (provider.uploadResponse!.success) {
            provider.refreshOwnerStore();
            ToastMessage.show(context, provider.uploadResponse!.message);
            context.pop();
          } else {
            ToastMessage.show(context, provider.uploadResponse!.message);
          }
        }
      }
    }
  }

  Widget _buildImage(BuildContext context) {
    final provider = context.watch<StoreProvider>();

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
                                  onPressed: () async {
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
      ToastMessage.show(context, 'Image added');
      provider.combineImages();
    }
  }

  void _onGalleryView() async {
    final provider = context.read<StoreProvider>();

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
