import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customDarkTheme = ThemeData.dark().copyWith(
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ),
);