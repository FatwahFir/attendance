import 'dart:async';
import 'dart:io';

import 'package:attendance/app/data/providers/auth_provider.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/app/utils/box.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool showPassword = true.obs;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _provider = Get.find<AuthProvider>();

  Future<void> login() async {
    try {
      isLoading(true);
      var data = {
        'username': username.text,
        'password': password.text,
      };

      var response = await _provider.login(data);
      if (response.statusCode == HttpStatus.ok) {
        await Box.setLoginData(response.body['user']).then((_) async {
          if (Box.user?.role == 'admin') {
            Get.offAllNamed(Routes.CORE);
          } else {
            Get.offAllNamed(Routes.ATTENDANCE);
          }
        });
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }

  void logout() async {
    try {
      await Box.loginState.erase().then(
            (_) => Get.offAllNamed(Routes.AUTH),
          );
    } catch (e) {
      MyUtils.exceptionHandler(e);
    }
  }
}
