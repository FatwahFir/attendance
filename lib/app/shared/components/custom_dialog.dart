import 'package:attendance/app/shared/components/common_button.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future<dynamic> show(
      {required Widget child,
      required String title,
      bool isShowCancelBtn = true,
      String submitBtnTxt = MyStrings.save,
      required VoidCallback onSubmit}) {
    return Get.defaultDialog(
      backgroundColor: Colors.white,
      radius: 5,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      title: title,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isShowCancelBtn
                  ? Expanded(
                      child: CommonButton(
                        onPressed: () {
                          Get.back();
                        },
                        backgroundColor: DefaultTheme.red80,
                        child: Text(
                          MyStrings.cancel,
                          style: Get.textTheme.labelMedium!
                              .copyWith(color: DefaultTheme.light100),
                        ),
                      ),
                    )
                  : SizedBox(),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CommonButton(
                    backgroundColor: DefaultTheme.blue80,
                    onPressed: onSubmit,
                    child: Text(submitBtnTxt)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
