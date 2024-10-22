import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:attendance/app/utils/converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static error({required List<String> errorList, int duration = 2}) {
    String message = '';
    if (errorList.isEmpty) {
      message = MyStrings.somethingWentWrong.tr;
    } else {
      for (var element in errorList) {
        String tempMessage = element.tr;
        message = message.isEmpty ? tempMessage : "$message\n$tempMessage";
      }
    }
    message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    Get.rawSnackbar(
      progressIndicatorBackgroundColor: Colors.transparent,
      progressIndicatorValueColor:
          const AlwaysStoppedAnimation<Color>(Colors.transparent),
      messageText:
          Text(message, style: TextStyle(color: DefaultTheme.light100)),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: DefaultTheme.red80.withOpacity(0.8),
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      duration: Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeIn,
      showProgressIndicator: true,
      leftBarIndicatorColor: Colors.transparent,
      animationDuration: const Duration(seconds: 1),
      borderColor: Colors.transparent,
      reverseAnimationCurve: Curves.easeOut,
      borderWidth: 2,
    );
  }

  static success({required List<String> successList, int duration = 2}) {
    String message = '';
    if (successList.isEmpty) {
      message = MyStrings.somethingWentWrong.tr;
    } else {
      for (var element in successList) {
        String tempMessage = element.tr;
        message = message.isEmpty ? tempMessage : "$message\n$tempMessage";
      }
    }
    message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    Get.rawSnackbar(
      progressIndicatorBackgroundColor: DefaultTheme.green80.withOpacity(0.8),
      progressIndicatorValueColor:
          const AlwaysStoppedAnimation<Color>(Colors.transparent),
      messageText:
          Text(message, style: TextStyle(color: DefaultTheme.light100)),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: DefaultTheme.green80,
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      duration: Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
      showProgressIndicator: true,
      leftBarIndicatorColor: Colors.transparent,
      animationDuration: const Duration(seconds: 2),
      borderColor: Colors.transparent,
      reverseAnimationCurve: Curves.easeOut,
      borderWidth: 2,
    );
  }
}
