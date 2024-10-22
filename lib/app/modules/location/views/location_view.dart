import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/app/shared/components/refresh_widget.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
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
        child: controller.obx((data) {
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
                      color: Colors.grey.shade300,
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
            onEmpty: RefreshWidget(
              title: MyStrings.noDataFound,
              onRefresh: () => controller.getLocations(),
            ),
            onError: (_) => RefreshWidget(
                  title: MyStrings.somethingWentWrong,
                  onRefresh: () => controller.getLocations(),
                )),
      ),
    );
  }
}
