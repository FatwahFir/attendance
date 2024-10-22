import 'package:attendance/app/modules/location/controllers/add_location_controller.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationView extends GetView<AddLocationController> {
  const AddLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Lokasi'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                zoomControlsEnabled: false,
                onLongPress: (coordinate) async {
                  controller.markers.clear();
                  if (controller.markers.isEmpty) {
                    await controller
                        .addMarker(coordinate)
                        .then((_) => controller.showDialog());
                  }
                },
                markers: controller.markers.toSet(),
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: controller.position.value, zoom: 15.0),
                onMapCreated: (GoogleMapController controller) {
                  this.controller.mapController.complete(controller);
                },
              ),
      ),
      floatingActionButton: Obx(
        () => controller.markers.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {
                  controller.markers.clear();
                },
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.clear,
                  color: DefaultTheme.red80,
                ),
              )
            : Container(), // Tidak tampilkan apa pun jika tombol disembunyikan
      ),
    );
  }
}
