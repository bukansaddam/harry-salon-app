import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:tugas_akhir_app/screen/widgets/card_location.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key, required this.initialLocation});

  final LatLng initialLocation;

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng? _initialLocation;
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};

  geo.Placemark? placemark;

  LatLng? locationData;

  @override
  void initState() {
    super.initState();
    _initialLocation = widget.initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        actions: [
          locationData != null
              ? IconButton(
                  onPressed: () {
                    context.pop(locationData);
                  },
                  icon: const Icon(Icons.done),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: _buildGoogleMap(),
    );
  }

  Widget _buildGoogleMap() {
    return Center(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialLocation!,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
                if (locationData != null) {
                  mapController.animateCamera(
                    CameraUpdate.newLatLngZoom(locationData!, 14),
                  );
                }
              });
            },
            markers: markers,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            onLongPress: (LatLng latLng) async {
              try {
                final info = await geo.placemarkFromCoordinates(
                    latLng.latitude, latLng.longitude);

                if (info.isNotEmpty) {
                  setState(() {
                    placemark = info.first;
                    locationData = latLng;
                  });
                } else {
                  debugPrint('placemark: No placemark found');
                }
              } catch (e) {
                setState(() {
                  placemark = null;
                });
                debugPrint('Error fetching placemark: $e');
              }

              onLongPress(latLng);
            },
            onTap: (argument) {
              if (markers.isEmpty) {
                ToastMessage.show(
                    context, 'Long press on the map to add a marker');
              }

              setState(() {
                placemark = null;
                markers.clear();
                locationData = null;
              });
            },
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'zoom-in',
                  onPressed: () {
                    mapController.animateCamera(
                      CameraUpdate.zoomIn(),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton.small(
                  heroTag: 'zoom-out',
                  onPressed: () {
                    mapController.animateCamera(
                      CameraUpdate.zoomOut(),
                    );
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
          if (placemark != null) CardLocation(placemark: placemark),
          Positioned(
            top: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                debugPrint('My location button pressed');
                onMyLocationButtonPress();
              },
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }

  void onLongPress(LatLng latLng) async {
    defineMarker(latLng);

    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 14),
    );
  }

  void defineMarker(LatLng latLng) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
    );
    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationsData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint("Location services is not available");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        debugPrint("Location permission is denied");
        return;
      }
    }

    locationsData = await location.getLocation();
    final latLng = LatLng(locationsData.latitude!, locationsData.longitude!);

    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    if (info.isNotEmpty) {
      setState(() {
        placemark = info.first;
        locationData = latLng;
      });
    } else {
      debugPrint('placemark: No placemark found');
    }

    defineMarker(latLng);
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 14),
    );
  }
}
