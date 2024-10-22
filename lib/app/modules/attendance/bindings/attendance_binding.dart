import 'package:attendance/app/data/providers/auth_provider.dart';
import 'package:attendance/app/data/providers/auttendance_provider.dart';
import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
    Get.lazyPut<AuttendanceProvider>(
      () => AuttendanceProvider(),
    );
  }
}
