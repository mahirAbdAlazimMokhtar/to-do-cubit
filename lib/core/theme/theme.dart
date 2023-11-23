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
              ))),


      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        //hint

        hintStyle: GoogleFonts.lato(
          color: AppColors.lightBlack,
          fontSize: 16,
        ),
        //fill Color
        filled: true,
        fillColor: AppColors.white,
      ));
}

ThemeData getDarkTheme() {
  return ThemeData(


      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        //hint

        hintStyle: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 16,
        ),
        //fill Color
        filled: true,
        fillColor: AppColors.lightBlack,
      ),
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
              ))));
}
