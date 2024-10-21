import 'package:attendance/app/modules/home/views/home_view.dart';
import 'package:attendance/app/modules/location/views/location_view.dart';
import 'package:attendance/app/modules/user/views/user_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CoreController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Widget> pages = [
    HomeView(),
    LocationView(),
    UserView(),
  ];
}
