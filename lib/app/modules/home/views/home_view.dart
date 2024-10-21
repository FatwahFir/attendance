import 'package:attendance/app/modules/home/widgets/home_card.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
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
      body: SafeArea(
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
                    text: "36",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  HomeCard(
                    icon: Iconsax.location,
                    color: DefaultTheme.red100,
                    text: "36",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  HomeCard(
                    icon: Iconsax.note,
                    color: DefaultTheme.green100,
                    text: "120",
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
