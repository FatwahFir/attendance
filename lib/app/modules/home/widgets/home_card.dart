import 'package:attendance/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
  });

  final Color color;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ), // Ubah nilai sesuai kebutuhan
      ),
      shadowColor: Colors.grey[200],
      child: Container(
        height: 120,
        width: Get.width * 0.29,
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -50,
              bottom: -10,
              child: Icon(
                icon,
                size: 100,
                color: color.withOpacity(0.7),
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 50, color: DefaultTheme.light100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
