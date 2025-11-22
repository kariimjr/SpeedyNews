import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondaryColor,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.secondaryColor,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.secondaryColor,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    ),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xffF6BD00)),
      backgroundColor: AppColors.primaryColor,
      // elevation: 1,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w500,
      ),

      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleLarge:TextStyle(
        color: AppColors.primaryColor,
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),

      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    ),
  );
}
