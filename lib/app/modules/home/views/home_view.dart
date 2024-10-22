import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/modules/home/widgets/home_card.dart';
import 'package:attendance/app/shared/components/common_button.dart';
import 'package:attendance/app/shared/components/common_text_field.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/box.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Box.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user?.userDetails?.name ?? '-'),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            elevation: 5,
            shadowColor: Colors.grey[200],
            icon: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Center(child: Image.asset('assets/images/avatar.png')),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                onTap: () {
                  Get.lazyPut<AuthController>(() => AuthController());
                  Get.find<AuthController>().logout();
                },
                child: Row(
                  children: [
                    Icon(Iconsax.logout),
                    SizedBox(
                      width: 5,
                    ),
                    Text(MyStrings.logout)
                  ],
                ),
              ),
            ],
          ).marginOnly(right: 10),
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeCard(
                            icon: Iconsax.user,
                            color: DefaultTheme.blue100,
                            text: "${controller.users.value}",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          HomeCard(
                            icon: Iconsax.location,
                            color: DefaultTheme.red100,
                            text: "${controller.locations.value}",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          HomeCard(
                            icon: Iconsax.note,
                            color: DefaultTheme.green100,
                            text: "${controller.attendances.value}",
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 7,
                      shadowColor: Colors.grey[200],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Form(
                              key: controller.formKey,
                              child: Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: CommonTextField(
                                    controller: controller.radius,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    labelText: MyStrings.maxRadius,
                                    keyboardType: TextInputType.number,
                                    validator: (val) {
                                      if (val?.isEmpty) {
                                        return MyStrings.requiredMsg;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 40,
                              width: Get.width * 0.2,
                              child: CommonButton(
                                child: Text(MyStrings.save),
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.formKey.currentState!.save();
                                    controller.updateMaxRadius();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
