import 'package:attendance/app/shared/components/common_button.dart';
import 'package:attendance/app/shared/components/common_text_field.dart';
import 'package:attendance/app/utils/consts/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 15,
                    shadowColor: Colors.grey[200],
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              TextConst.authText,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextField(
                              controller: controller.email,
                              labelText: TextConst.usernameLabel,
                              hintText: TextConst.usernameHint,
                              prefixIcon: Icons.person,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return TextConst.requiredValidationText;
                                } else if (!GetUtils.isEmail(value)) {
                                  return TextConst.emailValidationText;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextField(
                              controller: controller.password,
                              labelText: TextConst.passwordLabel,
                              hintText: TextConst.passHint,
                              prefixIcon: Icons.lock,
                              suffixIcon: controller.showPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onPressSuffix: () {
                                controller.showPassword.toggle();
                              },
                              obscureText: controller.showPassword.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return TextConst.requiredValidationText;
                                } else if (value.length < 8) {
                                  return TextConst.passwordValidationText;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AnimatedContainer(
                              width:
                                  controller.isLoading.value ? 50 : Get.width,
                              duration: const Duration(milliseconds: 500),
                              child: CommonButton(
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.formKey.currentState!.save();
                                    // controller.login();
                                  }
                                },
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 15,
                                ),
                                child: const Text(
                                  TextConst.loginText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
