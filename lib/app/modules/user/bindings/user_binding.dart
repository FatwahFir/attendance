import 'package:attendance/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
  }
}
