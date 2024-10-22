import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:attendance/app/data/providers/location_provider.dart';
import 'package:attendance/app/shared/components/common_button.dart';
import 'package:attendance/app/shared/components/common_text_field.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddLocationController extends GetxController {
  final Location _location = Location();
  final formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  Rx<LatLng> position = LatLng(0.0, 0.0).obs;
  LatLng? taggedPosition;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final _provider = Get.find<LocationProvider>();

  RxList<Marker> markers = <Marker>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  Future<void> addMarker(LatLng coordinate) async {
    try {
      taggedPosition = coordinate;
      markers.add(
        Marker(
            markerId: MarkerId(
              DateTime.now().toString(),
            ),
            icon: BitmapDescriptor.defaultMarker,
            position: coordinate,
            onTap: showDialog),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void updateCameraPos(LatLng pos) async {
    final controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position.value, zoom: 15.0),
      ),
    );
  }

  Future<void> initialize() async {
    try {
      isLoading.toggle();
      bool serviceEnabled;
      PermissionStatus permissionGranted;

      serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      await _location.getLocation().then((value) {
        position.value = LatLng(value.latitude!, value.longitude!);
      });

      _location.onLocationChanged.listen((LocationData currentLocation) {
        position.value =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
      });
      isLoading.toggle();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> createLocation() async {
    try {
      var data = {
        'admin_id': 1,
        'lat': taggedPosition?.latitude,
        'long': taggedPosition?.longitude,
        'name': nameC.text
      };
      var res = await _provider.addLocation(data);
      if (res.statusCode == HttpStatus.ok) {
        markers.clear();
        log('Okkkkk');
        Get.back();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> showDialog() {
    return Get.defaultDialog(
      backgroundColor: Colors.white,
      radius: 5,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      title: "Add Location",
      content: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextField(
              controller: nameC,
              labelText: "Nama Lokasi",
              hintText: "Nama Lokasi",
              validator: (val) {
                if (val?.isEmpty) {
                  return TextConst.requiredValidationText;
                } else {
                  return null;
                }
              },
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
                Text("lat: ${position.value.latitude}"),
                SizedBox(
                  width: 20,
                ),
                Text("long: ${position.value.longitude}"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          .copyWith(color: DefaultTheme.light100),
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
                      if (formKey.currentState!.validate() &&
                          taggedPosition != null) {
                        Get.back();
                        createLocation();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
