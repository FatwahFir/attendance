import 'package:attendance/app/shared/components/common_button.dart';
import 'package:attendance/app/shared/components/common_text_field.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
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
                              MyStrings.authText,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextField(
                              controller: controller.username,
                              labelText: MyStrings.username,
                              hintText: MyStrings.username,
                              prefixIcon: Icons.person,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return MyStrings.usernameEmptyMsg;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextField(
                              controller: controller.password,
                              labelText: MyStrings.password,
                              hintText: MyStrings.password,
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
                                  return MyStrings.requiredMsg;
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
                              child: Obx(
                                () => controller.isLoading.isTrue
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : CommonButton(
                                        onPressed: () {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            controller.formKey.currentState!
                                                .save();
                                            controller.login();
                                          }
                                        },
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 15,
                                        ),
                                        child: const Text(
                                          MyStrings.login,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
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
