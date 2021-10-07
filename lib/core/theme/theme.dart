import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Tajawal',
    primaryColor: AppColors.purple,
    colorScheme: const ColorScheme.light(
        primary: AppColors.purple, secondary: Colors.indigo),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
    ),
    dividerTheme:
        const DividerThemeData(color: AppColors.purple, thickness: 0.5),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        shape: const StadiumBorder(),
        side: const BorderSide(width: 1, color: AppColors.purple),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.purple,
        padding: const EdgeInsets.all(0),
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.purple),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.purple),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.purple),
      ),
    ),
  );
}

//===============================================================
