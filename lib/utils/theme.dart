import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF3A4BA8);
  static const Color secondryColor = Color(0xFFF8F9FB);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF000000);
  static const Color foregroundColor = Color(0xFFACAAAF);
  static const Color searchBoxText = Color(0xFFC8C5CA);

  
  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        secondary: backgroundColor,
      ),
      textTheme: TextTheme(
        labelMedium: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 12,
          fontWeight: FontWeight.w100,
          color: textColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.red,
        ),
        titleLarge: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 15,
          fontWeight: FontWeight.w100,
          color: searchBoxText,
        ),
        titleMedium: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 13,
          color: textColor,
        ),
        titleSmall: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: textColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textColor,
        ),
        bodySmall: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 15,
          fontWeight: FontWeight.w100,
          color: textColor,
        ),
        labelSmall: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 15,
          fontWeight: FontWeight.w100,
          color: primaryColor,
        ),
        labelLarge: TextStyle(
          fontFamily: 'IRANSans',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        titleTextStyle: TextStyle(
          color: textColor,
        ),
        iconTheme: const IconThemeData(
          color: textColor,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF00BFA5),
        secondary: const Color(0xFFFFC107),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontFamily: 'MyCustomFont',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }
}
