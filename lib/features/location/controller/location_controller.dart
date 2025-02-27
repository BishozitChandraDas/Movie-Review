import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  late GoogleMapController mapController;
  final LatLng initialPosition = const LatLng(23.8041, 90.4152); // Dhaka
  final RxSet<Marker> markers = <Marker>{}.obs; // Observable markers set

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermission();
    _addMarker(); // Add marker on init
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Permission Denied', 'Please enable location permissions in settings.');
    }
  }

  void _addMarker() {
    markers.add(
      Marker(
        markerId: const MarkerId('initialLocation'),
        position: initialPosition,
        infoWindow: const InfoWindow(title: 'Initial Location', snippet: 'Dhaka'),
        icon: BitmapDescriptor.defaultMarker, // Default marker icon
      ),
    );
  }
}
