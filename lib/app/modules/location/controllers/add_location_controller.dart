import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddLocationController extends GetxController {
  final Location _location = Location();
  Rx<LatLng> position = LatLng(0.0, 0.0).obs;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  RxList<Marker> markers = <Marker>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  Future<void> addMarker(LatLng coordinate) async {
    try {
      markers.add(
        Marker(
          markerId: MarkerId(
            DateTime.now().toString(),
          ),
          icon: BitmapDescriptor.defaultMarker,
          position: coordinate,
        ),
      );
      // updateCameraPos(coordinate);
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

      _location.getLocation().then((value) {
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
}
