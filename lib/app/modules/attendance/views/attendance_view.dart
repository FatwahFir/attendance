import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Niganiga"),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            elevation: 5,
            shadowColor: Colors.grey[200],
            icon: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Center(child: Text("N")),
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
                    Text('Log Out')
                  ],
                ),
              ),
            ],
          ).marginOnly(right: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 15,
          shadowColor: Colors.grey[200],
          child: Container(
            height: 350,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 150,
                      width: Get.width * 0.3,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fatwah Firmansyah SR"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("083821177545"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Desa leuwigeded"),
                        ],
                      ),
                    ),
                  ],
                ),
                AvatarGlow(
                  glowColor: DefaultTheme.green80,
                  glowRadiusFactor: 0.3,
                  child: Material(
                    // Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: DefaultTheme.green100,
                      radius: 50.0,
                      child: Text(
                        "IN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ).marginOnly(top: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
