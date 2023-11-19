import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //background color for the app
    scaffoldBackgroundColor: AppColors.backgroundColor,
    //app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
    ),
    //text theme
    textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 16,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
      )
    )
  );
}
ThemeData getDarkTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      //background color for the app
      scaffoldBackgroundColor: AppColors.backgroundColor,
      //app bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
      ),
      //text theme
      textTheme: TextTheme(
          displayLarge: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
          displayMedium: GoogleFonts.lato(
            color: AppColors.white,
            fontSize: 16,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )
          )
      )
  );
}