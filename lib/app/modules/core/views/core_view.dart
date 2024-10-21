import 'package:attendance/app/theme/default_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          onTap: (index) => controller.currentIndex.value = index,
          currentIndex: controller.currentIndex.value,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(
                Iconsax.home,
                color: DefaultTheme.dark20,
              ),
              activeIcon: Icon(
                Iconsax.home,
                color: DefaultTheme.primaryColor,
              ),
              title: Text("Home"),
              selectedColor: DefaultTheme.primaryColor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(
                Iconsax.location_add,
                color: DefaultTheme.dark20,
              ),
              activeIcon: Icon(
                Iconsax.location_add,
                color: DefaultTheme.primaryColor,
              ),
              title: Text("Locations"),
              selectedColor: DefaultTheme.primaryColor,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(
                Iconsax.user_tag,
                color: DefaultTheme.dark20,
              ),
              activeIcon: Icon(
                Iconsax.user_tag,
                color: DefaultTheme.primaryColor,
              ),
              title: Text("Users Location"),
              selectedColor: DefaultTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
