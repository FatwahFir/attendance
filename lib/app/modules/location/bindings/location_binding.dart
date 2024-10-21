import 'package:get/get.dart';

import 'package:attendance/app/data/providers/location_provider.dart';
import 'package:attendance/app/modules/location/controllers/add_location_controller.dart';

import '../controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLocationController>(
      () => AddLocationController(),
    );
    Get.lazyPut<LocationController>(
      () => LocationController(),
    );
    Get.lazyPut<LocationProvider>(
      () => LocationProvider(),
    );
  }
}
