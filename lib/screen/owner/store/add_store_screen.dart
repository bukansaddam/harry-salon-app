import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

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

  LatLng? locationData;
  LatLng currentLocation = const LatLng(0, 0);

  geo.Placemark? placemark;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imagesProvider = Provider.of<StoreProvider>(context, listen: false);

    getMyLocation();

    if (locationData != null && placemark != null) {
      _addressController.text =
          '${placemark!.street}, ${placemark!.subLocality}, ${placemark!.locality}, ${placemark!.country}';
    }
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
                                      '${placemark!.street}, ${placemark!.subLocality}, ${placemark!.locality}, ${placemark!.country}';
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

  void getMyLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    final Location location = Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint("Location services are not available");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        debugPrint("Location permission not granted");
        return;
      }
    }

    final locationDataResult = await location.getLocation();
    final latLng =
        LatLng(locationDataResult.latitude!, locationDataResult.longitude!);

    if (mounted) {
      setState(() {
        currentLocation = latLng;
        locationData = latLng;
      });
    }

    try {
      final placemarks = await geo.placemarkFromCoordinates(
        locationDataResult.latitude!,
        locationDataResult.longitude!,
      );
      if (placemarks.isNotEmpty) {
        setState(() {
          placemark = placemarks.first;
          _addressController.text =
              '${placemark!.street}, ${placemark!.subLocality}, ${placemark!.locality}, ${placemark!.country}';
        });
      }
    } catch (e) {
      debugPrint('Error fetching placemark: $e');
    }
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
        ToastMessage.show(context, 'Please add image');
      } else {
        await provider.addStore(
          name,
          description,
          address,
          locationData!.latitude,
          locationData!.longitude,
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
                                    context.pop();
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.removeImage(index);
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
    }

    if (mounted) {
      context.pop();
    }
  }
}
