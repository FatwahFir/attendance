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


// DropdownSearch<Province>(
//         validator: (value) {
//           if (value == null) {
//             return "Kolom ini wajib di isi";
//           }
//           return null;
//         },
//         compareFn: (item, sItem) => item.id == sItem.id,
//         popupProps: PopupProps.menu(
//           itemBuilder: (context, item, isSelected) => ListTile(
//             selected: isSelected,
//             selectedTileColor: ColorTheme.secondary,
//             title: Text(
//               item.name!,
//               style: TextStyle(
//                   color: isSelected ? ColorTheme.primary : Colors.black),
//             ),
//           ),
//           searchFieldProps: TextFieldProps(
//               cursorColor: ColorTheme.primary,
//               cursorWidth: 1.5,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.all(10),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: ColorTheme.primary.withOpacity(0.5)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: ColorTheme.primary),
//                 ),
//               )),
//           showSearchBox: true,
//           showSelectedItems: true,
//         ),
//         asyncItems: (_) async {
//           var response = await Dio().get("http://103.149.71.152/api/province",
//               options: Options(headers: {
//                 'Accept': 'application/json',
//                 'Authorization':
//                     'Bearer ${SharedPreferences.loginState.read('token')}',
//               }));
//           var models = Province.fromJsonList(response.data);
//           return models;
//         },
//         dropdownDecoratorProps: DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//             labelText: "Provinsi",
//             hintText: "Pilih Provinsi",
//             floatingLabelStyle:
//                 TextStyle(color: ColorTheme.primary.withOpacity(0.5)),
//             hintStyle: const TextStyle(
//                 color: Colors.grey, fontWeight: FontWeight.normal),
//             labelStyle: const TextStyle(color: Colors.grey),
//             enabledBorder: UnderlineInputBorder(
//               borderSide:
//                   BorderSide(color: ColorTheme.primary.withOpacity(0.5)),
//             ),
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: ColorTheme.primary),
//             ),
//           ),
//         ),
//         onChanged: (value) {
//           controller.provinceId.value = value!.id!;
//         },
//         selectedItem: controller.userProvince,
//       ),