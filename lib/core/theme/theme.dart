import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.indigo,
    colorScheme: const ColorScheme.light(),
    textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
  );
}

//===============================================================
ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.indigo,
    colorScheme: const ColorScheme.dark(),
    textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
  );
}
