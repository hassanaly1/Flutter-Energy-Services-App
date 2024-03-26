import 'package:energy_services/helper/appbar.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/googlemap_controller.dart';

class GoogleMapScreen extends StatelessWidget {
  final MapController mapController = Get.find();

  GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ReUsableAppbar(
              title: 'Select Location',
              backgroundColor: AppColors.blueTextColor,
            ),
            Obx(
              () => ReUsableContainer(
                width: double.infinity,
                child: CustomTextWidget(
                  text: mapController.selectedAddress.value,
                  maxLines: 2,
                ),
              ),
            ),
            // Obx(
            //   () => ReUsableContainer(
            //     child: CustomTextWidget(
            //         text: mapController.selectedLocation.value.toString()),
            //   ),
            // ),
            Obx(() {
              if (mapController.userCurrentLocation.value == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(child: _buildMap(context));
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: mapController.onMapCreated,
          initialCameraPosition: CameraPosition(
            target:
                mapController.userCurrentLocation.value ?? const LatLng(0, 0),
            zoom: 14.0,
          ),
          markers: Set<Marker>.of(_createMarkers()),
          onCameraMove: mapController.onCameraMove,
        ),
        if (mapController.selectedLocation.value != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
              child: CustomButton(
                buttonText: 'Confirm Location',
                onTap: () {
                  Get.back();
                  debugPrint(
                      'Confirmed location: ${mapController.selectedAddress.value}');
                },
                usePrimaryColor: true,
              ),
            ),
          ),
      ],
    );
  }

  List<Marker> _createMarkers() {
    List<Marker> markers = [];
    if (mapController.selectedLocation.value != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('selectedLocation'),
          position: mapController.selectedLocation.value!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          draggable: true,
          onDragEnd: mapController.onMarkerDragEnd,
        ),
      );
    }
    return markers;
  }
}
