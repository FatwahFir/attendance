import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool showPassword = true.obs;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login() async {
    try {
      isLoading.value = true;
//
    } catch (e) {
      //
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    try {} catch (e) {}
  }
}
