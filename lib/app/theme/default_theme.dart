import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme {
  DefaultTheme._();

  static Color get primaryColor => const Color(0xff8F57FF);
  static Color get primaryColorDark => const Color(0xFF4A1DA1);
  static Color get secondaryColor => const Color(0xffEEE5FF);

  static Color get accentColor => const Color(0xFFC084FC);
  static Color get neutralColor => const Color(0xFFFFFFFF);
  static Color get base100Color => const Color(0xFFFFFFFF);
  static Color get infoColor => const Color(0xFFBAE6FD);
  static Color get successColor => const Color(0xFF4ADE80);
  static Color get warningColor => const Color(0xFFFEF08A);
  static Color get errorColor => const Color(0xFFF87171);
  static Color get base900Color => const Color.fromARGB(255, 21, 24, 29);
  static Color get darkColor => const Color(0xFF121212);
  static Color get grayColor => const Color.fromARGB(255, 212, 212, 212);

  static Color get dark20 => const Color(0xFF7A7E80);
  static Color get dark50 => const Color(0xFF464A4D);
  static Color get dark75 => const Color(0xFF161719);
  static Color get dark100 => const Color(0xFF0D0E0F);
  static Color get light20 => const Color(0xFFE3E5E5);
  static Color get light40 => const Color(0xFFF2F4F5);
  static Color get light60 => const Color(0xFFF7F9FA);
  static Color get light80 => const Color(0xFFFBFBFB);
  static Color get light100 => const Color(0xFFFFFFFF);
  static Color get violet20 => const Color(0xFFEEE5FF);
  static Color get violet40 => const Color(0xFFD3BDFF);
  static Color get violet60 => const Color(0xFFB18AFF);
  static Color get violet80 => const Color(0xFF8F57FF);
  static Color get violet100 => const Color(0xFF7F3DFF);
  static Color get red20 => const Color(0xFFFDD5D7);
  static Color get red40 => const Color(0xFFFDA2A9);
  static Color get red60 => const Color(0xFFFD6F7A);
  static Color get red80 => const Color(0xFFFD5662);
  static Color get red100 => const Color(0xFFFD3C4A);
  static Color get green20 => const Color(0xFFCFFAEA);
  static Color get green40 => const Color(0xFF93EACA);
  static Color get green60 => const Color(0xFF65D1AA);
  static Color get green80 => const Color(0xFF2AB784);
  static Color get green100 => const Color(0xFF00A86B);
  static Color get yellow20 => const Color(0xFFFCEED4);
  static Color get yellow40 => const Color(0xFFFCDDA1);
  static Color get yellow60 => const Color(0xFFFCCC6F);
  static Color get yellow80 => const Color(0xFFFCBB3C);
  static Color get yellow100 => const Color(0xFFFCAC12);
  static Color get blue20 => const Color(0xFFBDDCFF);
  static Color get blue40 => const Color(0xFF8AC0FF);
  static Color get blue60 => const Color(0xFF57A5FF);
  static Color get blue80 => const Color(0xFF248AFF);
  static Color get blue100 => const Color(0xFF0077FF);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: neutralColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColor,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: neutralColor,
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: neutralColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: TextStyle(
          color: base900Color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        titleLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: base900Color,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: base900Color,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: base900Color,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        // prefixIconColor: base900Color,
        // prefixStyle: TextStyle(
        //   color: base900Color,
        // ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        fillColor: base100Color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: base900Color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: base900Color,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
      ),
    );
  }
}
