import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.indigo,
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black, unselectedLabelColor: Colors.black54),
    colorScheme: const ColorScheme.light(
        primary: Colors.indigo, secondary: Colors.indigo),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      titleTextStyle:
          Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
    ),
    dividerTheme: const DividerThemeData(color: Colors.indigo, thickness: 0.5),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        shape: const StadiumBorder(),
        side: const BorderSide(width: 1, color: Colors.indigo),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(context).textTheme.headline6,
        primary: Colors.indigo,
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
        borderSide: const BorderSide(color: Colors.indigo),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.indigo),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.indigo),
      ),
    ),
  );
}

//===============================================================
