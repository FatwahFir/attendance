import 'dart:async';
import 'dart:io';

import 'package:attendance/app/data/providers/auttendance_provider.dart';
import 'package:attendance/app/shared/components/custom_snackbar.dart';
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
  RxString attendanceStatus = 'open'.obs;
  final _provider = Get.find<AuttendanceProvider>();

  @override
  void onInit() async {
    super.onInit();
    await checkAttendanceStatus().then(
      (_) => attendanceStatus.value = Box.attendanceStatus!,
    );
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

  Future<void> submitAttendance() async {
    try {
      var data = {
        'user_id': user!.id,
        'lat': position.value.latitude,
        'long': position.value.longitude,
        'type': 'in',
      };

      var res = await _provider.submitAttendance(data);
      if (res.statusCode == HttpStatus.ok) {
        Box.setAttendanceStatus('in');
        CustomSnackBar.success(successList: [res.body['message']]);
      } else if (res.statusCode == HttpStatus.badRequest) {
        if (res.body['status'] == 'already-in') {
          Box.setAttendanceStatus('in');
        } else if (res.body['status'] == 'already-out') {
          Box.setAttendanceStatus('out');
        }
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
  }

  Future<void> checkAttendanceStatus() async {
    try {
      var res = await _provider.checkAttendanceStatus(user!.id!);
      if (res.statusCode == HttpStatus.ok) {
        if (res.body['status'] == 'not-checked-in') {
          Box.setAttendanceStatus('open');
        } else if (res.body['status'] == 'checked-out') {
          Box.setAttendanceStatus('out');
        } else if (res.body['status'] == 'checked-in') {
          Box.setAttendanceStatus('in');
        }
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
  }
}
