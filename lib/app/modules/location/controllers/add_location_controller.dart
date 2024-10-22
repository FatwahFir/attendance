import 'dart:async';
import 'dart:io';

import 'package:attendance/app/data/providers/location_provider.dart';
import 'package:attendance/app/modules/location/controllers/location_controller.dart';
import 'package:attendance/app/shared/components/common_text_field.dart';
import 'package:attendance/app/shared/components/custom_dialog.dart';
import 'package:attendance/app/shared/components/custom_snackbar.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:attendance/app/utils/my_utils.dart';
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
      MyUtils.exceptionHandler(e);
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

      if (!await MyUtils.askLocationPermission(_location)) {
        return;
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
      MyUtils.exceptionHandler(e);
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
        Get.back();
        Get.find<LocationController>().getLocations();
        CustomSnackBar.success(successList: [res.body['message']]);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
  }

  Future<dynamic> showDialog() {
    return CustomDialog.show(
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextField(
                controller: nameC,
                labelText: MyStrings.locationName,
                hintText: MyStrings.locationName,
                validator: (val) {
                  if (val?.isEmpty) {
                    return MyStrings.requiredMsg;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(MyStrings.coordinate),
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
            ],
          )),
      title: MyStrings.addLocation,
      onSubmit: () {
        if (formKey.currentState!.validate() && taggedPosition != null) {
          Get.back();
          createLocation();
        }
      },
    );
  }
}
