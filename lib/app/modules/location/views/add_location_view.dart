import 'package:attendance/app/modules/location/controllers/add_location_controller.dart';
import 'package:attendance/app/shared/components/common_button.dart';
import 'package:attendance/app/shared/components/common_text_field.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/text_const.dart';
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
                  await controller.addMarker(coordinate).then(
                        (_) => Get.defaultDialog(
                          backgroundColor: Colors.white,
                          radius: 5,
                          barrierDismissible: false,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          title: "Add Location",
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextField(
                                labelText: "Nama Lokasi",
                                hintText: "Nama Lokasi",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Titik Koordinat"),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                      "lat: ${controller.position.value.latitude}"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      "long: ${controller.position.value.longitude}"),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CommonButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      backgroundColor: DefaultTheme.red80,
                                      child: Text(
                                        TextConst.cancelText,
                                        style: Get.textTheme.labelMedium!
                                            .copyWith(
                                                color: DefaultTheme.light100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: CommonButton(
                                      backgroundColor: DefaultTheme.blue80,
                                      child: const Text(TextConst.saveText),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
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
