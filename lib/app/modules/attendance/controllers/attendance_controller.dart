import 'dart:async';

import 'package:attendance/app/utils/box.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class AttendanceController extends GetxController {
  final user = Box.user;
  RxBool isLoading = false.obs;
  final Location _location = Location();
  Rx<LatLng> position = LatLng(0.0, 0.0).obs;
  var distance = Distance();
  RxDouble distanceM = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    await initialize();
  }

  double getDistance() {
    return distance(
        LatLng(
          double.parse(user?.userDetails?.location?.lat ?? '0'),
          double.parse(user?.userDetails?.location?.long ?? '0'),
        ),
        position.value);
  }

  Future<void> initialize() async {
    try {
      if (!await MyUtils.askLocationPermission(_location)) {
        return;
      }

      await _location.getLocation().then((value) {
        position.value = LatLng(value.latitude!, value.longitude!);
      }).then(
        (_) => distanceM.value = getDistance(),
      );

      _location.onLocationChanged.listen((LocationData currentLocation) async {
        position.value =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        distanceM.value = getDistance();
      });
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
  }
}
