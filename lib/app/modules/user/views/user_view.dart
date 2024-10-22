import 'package:attendance/app/modules/user/widgets/user_tile.dart';
import 'package:attendance/app/shared/components/refresh_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getUsers(),
        child: controller.obx(
          (data) {
            return ListView.separated(
              itemCount: data?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) => UserTile(user: data![index])
                  .marginSymmetric(horizontal: 10)
                  .marginOnly(top: index == 0 ? 10 : 0),
            );
          },
          onEmpty: RefreshWidget(
            title: "Data Kosong",
            onRefresh: () => controller.getUsers(),
          ),
          onError: (_) => RefreshWidget(
            title: "Terjadi Kesalahan",
            onRefresh: () => controller.getUsers(),
          ),
        ),
      ),
    );
  }
}
