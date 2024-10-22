import 'package:attendance/app/data/models/location_model.dart';
import 'package:attendance/app/data/models/user_model.dart';
import 'package:attendance/app/data/providers/location_provider.dart';
import 'package:attendance/app/modules/user/controllers/user_controller.dart';
import 'package:attendance/app/shared/components/custom_dialog.dart';
import 'package:attendance/app/theme/default_theme.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    Location selectedLocation = Location();
    return Container(
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
          Iconsax.user,
          size: 35,
          color: DefaultTheme.dark20.withOpacity(0.5),
        ),
        title: Text(user.userDetails?.name ?? '-'),
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
            Text(user.userDetails?.location?.name ?? '-'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            CustomDialog.show(
              child: Form(
                key: controller.formkey,
                child: DropdownSearch<Location>(
                  itemAsString: (item) => item.name!,
                  asyncItems: (_) async {
                    Get.lazyPut<LocationProvider>(() => LocationProvider());

                    return await Get.find<LocationProvider>().getLocations();
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Kolom ini wajib di isi";
                    }
                    return null;
                  },
                  compareFn: (item, sItem) => item.id == sItem.id,
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    constraints: BoxConstraints(),
                    itemBuilder: (context, item, isSelected) => ListTile(
                      tileColor: Colors.white,
                      selected: isSelected,
                      selectedTileColor: DefaultTheme.primaryColor,
                      title: Text(
                        item.name!,
                        style: TextStyle(
                            color: isSelected
                                ? DefaultTheme.primaryColor
                                : Colors.black),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      selectedLocation = value;
                    }
                  },
                  selectedItem: user.userDetails?.location,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
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
                ),
              ),
              title: MyStrings.changeLocation,
              onSubmit: () {
                if (controller.formkey.currentState!.validate()) {
                  Get.back();
                  controller.saveLocation(
                    user.id!,
                    selectedLocation.id!,
                  );
                }
              },
            );
          },
          icon: Icon(
            size: 20,
            Iconsax.edit,
            color: DefaultTheme.blue100,
          ),
        ),
      ),
    );
  }
}
