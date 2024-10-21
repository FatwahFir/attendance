import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Locations'),
        centerTitle: true,
        actions: [
          IconButton(
            // highlightColor: DefaultTheme.primaryColor,
            onPressed: () {
              // Get.defaultDialog(
              //   backgroundColor: Colors.white,
              //   radius: 5,
              //   barrierDismissible: false,
              //   contentPadding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              //   title: "Add Location",
              //   content: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       CommonTextField(
              //         labelText: "Nama Lokasi",
              //         hintText: "Nama Lokasi",
              //       ),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       Text("Titik Koordinat"),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         children: [
              //           Text("lat: ${controller.position.value.latitude}"),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Text("long: ${controller.position.value.longitude}"),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Expanded(
              //             child: CommonButton(
              //               onPressed: () {
              //                 Get.back();
              //               },
              //               backgroundColor: DefaultTheme.red80,
              //               child: Text(
              //                 TextConst.cancelText,
              //                 style: Get.textTheme.labelMedium!
              //                     .copyWith(color: DefaultTheme.light100),
              //               ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 5,
              //           ),
              //           Expanded(
              //             child: CommonButton(
              //               backgroundColor: DefaultTheme.blue80,
              //               child: const Text(TextConst.saveText),
              //               onPressed: () {
              //                 Get.back();
              //               },
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
              Get.toNamed(Routes.ADD_LOCATION);
            },
            icon: Icon(
              Iconsax.add,
            ),
          ).marginOnly(right: 10)
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getLocations(),
        child: controller.obx(
          (data) {
            return ListView.separated(
              itemCount: data?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: index == 0 ? 10 : 0),
                  height: 70,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: DefaultTheme.light100,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      Iconsax.location,
                      size: 35,
                      color: DefaultTheme.dark20.withOpacity(0.5),
                    ),
                    title: Text(data?[index].name ?? '-'),
                    subtitle: Row(
                      children: [
                        Text("lat: ${data?[index].lat ?? '-'}"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("long: ${data?[index].long ?? '-'}"),
                      ],
                    ),
                  ),
                ).marginSymmetric(horizontal: 10);
              },
            );
          },
          onEmpty: Center(
            child: Text("Data kosong"),
          ),
          onError: (_) => Center(
            child: Text("Terjadi Kesalahan"),
          ),
        ),
      ),
    );
  }
}
