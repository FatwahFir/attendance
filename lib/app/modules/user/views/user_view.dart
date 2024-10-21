import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/text_const.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../shared/components/common_button.dart';
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
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => Container(
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
              Iconsax.user,
              size: 35,
              color: DefaultTheme.dark20.withOpacity(0.5),
            ),
            title: Text("Ujang Slebew"),
            subtitle: Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 12,
                  color: DefaultTheme.red80,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text("Ruang HRD"),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: Colors.white,
                  radius: 5,
                  barrierDismissible: false,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: "Change Location",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownSearch<String>(
                        items: (filter, infiniteScrollProps) =>
                            ["Menu", "Dialog", "Modal", "BottomSheet"],
                        decoratorProps: DropDownDecoratorProps(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 14),
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Pilih Lokasi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: DefaultTheme.darkColor,
                              ),
                            ),
                            focusColor: DefaultTheme.darkColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: DefaultTheme.grayColor,
                              ),
                            ),
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          fit: FlexFit.loose,
                          constraints: BoxConstraints(),
                          showSelectedItems: false,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CommonButton(
                              onPressed: () {
                                Get.back();
                              },
                              backgroundColor: DefaultTheme.red80,
                              child: Text(
                                TextConst.cancelText,
                                style: Get.textTheme.labelMedium!
                                    .copyWith(color: DefaultTheme.light100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: CommonButton(
                              backgroundColor: DefaultTheme.blue80,
                              child: const Text(TextConst.saveText),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                size: 20,
                Iconsax.edit,
                color: DefaultTheme.blue100,
              ),
            ),
          ),
        ).marginSymmetric(horizontal: 10),
      ),
    );
  }
}
