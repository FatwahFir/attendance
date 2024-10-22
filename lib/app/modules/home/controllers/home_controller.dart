import 'dart:io';

import 'package:attendance/app/data/providers/home_provider.dart';
import 'package:attendance/app/shared/components/custom_snackbar.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final radius = TextEditingController();
  final _provider = Get.find<HomeProvider>();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> updateMaxRadius() async {
    try {
      isLoading(true);
      print(radius.text);
      var res = await _provider.updateMaxRadius(int.parse(radius.text));
      if (res.statusCode == HttpStatus.ok) {
        CustomSnackBar.success(
          successList: [
            res.body['message'],
          ],
        );
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }
}
