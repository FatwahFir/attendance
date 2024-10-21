import 'dart:developer';

import 'package:attendance/app/data/models/user_model.dart';
import 'package:attendance/app/data/providers/user_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<List<User>> {
  // ignore: prefer_final_fields
  List<User> _users = <User>[];
  final _provider = Get.find<UserProvider>();
  final formkey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    await getUsers();
  }

  Future<void> getUsers() async {
    try {
      change(_users, status: RxStatus.loading());
      _users.clear();
      _users.addAll(await _provider.getUsers());
      change(_users, status: RxStatus.success());
    } catch (e) {
      log(e.toString());
      change(_users, status: RxStatus.error());
    }
  }

  Future<void> saveLocation(int userId, int locationId) async {
    try {
      var data = {
        'user_id': userId,
        'location_id': locationId,
      };
      await _provider.setUserLocation(data).then((res) => getUsers());
    } catch (e) {
      log(e.toString());
    }
  }
}
