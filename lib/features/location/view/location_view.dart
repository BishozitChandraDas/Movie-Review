import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movie_app/core/style/global_textstyle.dart';
import 'package:movie_app/features/location/controller/location_controller.dart';

class LocationView extends StatelessWidget {
  LocationView({super.key});

  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Location",
          style: globalTextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.initialPosition,
              zoom: 12,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: controller.markers.toSet(),
          ),
        ),
      ),
    );
  }
}
