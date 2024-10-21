import 'package:attendance/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
    required this.title,
    required this.onRefresh,
  });

  final String title;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Data kosong"),
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            backgroundColor: DefaultTheme.blue20, // Warna background
            radius: 25, // Ukuran lingkaran
            child: IconButton(
              iconSize: 30,
              onPressed: onRefresh,
              icon: Icon(Iconsax.refresh,
                  color: DefaultTheme.blue80), // Warna ikon
            ),
          )
        ],
      ),
    );
  }
}
