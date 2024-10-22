import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/shared/components/custom_dialog.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:attendance/app/utils/date_formatter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({super.key});
  @override
  Widget build(BuildContext context) {
    final user = controller.user;
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
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Card(
                        elevation: 7,
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
                                    child:
                                        Image.asset('assets/images/avatar.png'),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              user?.userDetails?.name ?? '-',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Iconsax.tag_user,
                                                size: 16,
                                                color: DefaultTheme.blue40,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(user?.userDetails?.location
                                                      ?.name ??
                                                  '-'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Iconsax.call,
                                                size: 16,
                                                color: DefaultTheme.green40,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(user?.userDetails?.phone ??
                                                  '-'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Iconsax.location,
                                                size: 16,
                                                color: DefaultTheme.red40,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Flexible(
                                                child: Text(user?.userDetails
                                                        ?.address ??
                                                    '-'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Distance: ${controller.distanceM.value} m",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() {
                                var status = controller.attendanceStatus.value;
                                return InkWell(
                                  child: AvatarGlow(
                                    glowColor: status == "open"
                                        ? DefaultTheme.green80
                                        : status == 'in'
                                            ? DefaultTheme.red80
                                            : DefaultTheme.dark20
                                                .withOpacity(0.5),
                                    glowRadiusFactor: 0.1,
                                    child: Material(
                                      elevation: 8.0,
                                      shape: CircleBorder(),
                                      child: CircleAvatar(
                                        backgroundColor: status == "open"
                                            ? DefaultTheme.green80
                                            : status == 'in'
                                                ? DefaultTheme.red80
                                                : DefaultTheme.dark20
                                                    .withOpacity(0.5),
                                        radius: 50.0,
                                        child: Text(
                                          status == "open"
                                              ? MyStrings.checkIn
                                              : status == 'in'
                                                  ? MyStrings.checkOut
                                                  : MyStrings.checkIn,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ).marginOnly(top: 40),
                                  onTap: () {
                                    if (controller.distanceM <= 50.0 &&
                                        controller.attendanceStatus.value !=
                                            'out') {
                                      controller.submitAttendance();
                                    } else if (controller.distanceM > 50.0) {
                                      CustomDialog.show(
                                        isShowCancelBtn: false,
                                        submitBtnTxt: MyStrings.ok,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Icon(
                                                Iconsax.warning_2,
                                                color: DefaultTheme.red80,
                                                size: 60,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(MyStrings.locationWarningMsg),
                                          ],
                                        ),
                                        title: MyStrings.locationWarningTitle,
                                        onSubmit: () => Get.back(),
                                      );
                                    }
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 7,
                        shadowColor: Colors.grey[200],
                        child: Container(
                          height: 200,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MyStrings.todayAttendance,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Divider(),
                              Expanded(
                                child: controller.attendances.isEmpty
                                    ? Center(
                                        child: Text(MyStrings.noAttendance),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            controller.attendances.length,
                                        itemBuilder: (context, index) {
                                          var data =
                                              controller.attendances[index];
                                          return ListTile(
                                            leading: Icon(
                                              Iconsax.clock,
                                              color: data.type == 'in'
                                                  ? DefaultTheme.green80
                                                  : DefaultTheme.red80,
                                            ),
                                            title: Text(
                                              DateFormatter.ddMMMMyyyy(
                                                  data.createdAt!),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                                "lat: ${data.lat}, long: ${data.long}"),
                                            trailing: Text(
                                                DateFormatter.timeWithoutSecISO(
                                                    data.createdAt!)),
                                          );
                                        }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
