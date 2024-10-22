import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/box.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await Box.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme.theme,
      title: "Application",
      initialRoute: getInitialRoute(),
      getPages: AppPages.routes,
    ),
  );
}

String getInitialRoute() {
  if (Box.loginState.read('user') == null) {
    return Routes.AUTH;
  } else {
    if (Box.user?.role == 'admin') {
      return Routes.CORE;
    } else {
      return Routes.ATTENDANCE;
    }
  }
  // return Routes.main_menu_store;
}
