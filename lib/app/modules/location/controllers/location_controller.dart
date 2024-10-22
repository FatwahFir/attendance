import 'dart:async';

import 'package:attendance/app/data/models/location_model.dart';
import 'package:attendance/app/data/providers/location_provider.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:get/get.dart';

class LocationController extends GetxController
    with StateMixin<List<Location>> {
  // ignore: prefer_final_fields
  List<Location> _locations = <Location>[];
  final _provider = Get.find<LocationProvider>();

  @override
  void onInit() async {
    super.onInit();
    await getLocations();
  }

  Future<void> getLocations() async {
    try {
      change(_locations, status: RxStatus.loading());
      _locations.clear();
      _locations.addAll(await _provider.getLocations());
      change(_locations, status: RxStatus.success());
    } catch (e) {
      MyUtils.exceptionHandler(e);
      change(_locations, status: RxStatus.error());
    }
  }
}
