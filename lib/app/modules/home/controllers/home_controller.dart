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
  RxInt users = 0.obs;
  RxInt locations = 0.obs;
  RxInt attendances = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await getInfo();
  }

  Future<void> updateMaxRadius() async {
    try {
      isLoading(true);
      var res = await _provider.updateMaxRadius(int.parse(radius.text));
      if (res.statusCode == HttpStatus.ok) {
        await getInfo();
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

  Future<void> getInfo() async {
    try {
      isLoading(true);
      var res = await _provider.getInfo();
      if (res.statusCode == HttpStatus.ok) {
        var data = res.body['data'];
        users.value = data['user_count'];
        locations.value = data['location_count'];
        attendances.value = data['attendance_count'];
        radius.text = data['max_radius'].toString();
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }
}
