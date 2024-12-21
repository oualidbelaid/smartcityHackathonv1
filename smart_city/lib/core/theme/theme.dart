import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static ThemeData arabeTheme = ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Droid",
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(fontStyle: FontStyle.normal),
        labelLarge: TextStyle(fontStyle: FontStyle.normal),
        labelMedium: TextStyle(fontStyle: FontStyle.normal),
        labelSmall: TextStyle(fontStyle: FontStyle.normal),
        bodyLarge: TextStyle(fontStyle: FontStyle.normal),
        bodyMedium: TextStyle(fontStyle: FontStyle.normal),
        bodySmall: TextStyle(fontStyle: FontStyle.normal),
        // labelMedium: TextStyle(fontWeight: FontWeight.w300, fontSize: 9.sp),
        // headline1: TextStyle(
        //     color: AppColor.primaryColor,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 25,
        //     fontFamily: "Droid",
        //     height: 1.5),
        // headline5: TextStyle(
        //     fontWeight: FontWeight.w400,
        //     fontSize: 18,
        //     fontFamily: "Droid",
        //     color: Color.fromARGB(255, 70, 70, 70),
        //     height: 1.5)
      ));
  static ThemeData frEnTheme = ThemeData(
      fontFamily: "SanFrancisco",
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(fontStyle: FontStyle.normal),
        labelLarge: TextStyle(fontStyle: FontStyle.normal),
        labelMedium: TextStyle(fontStyle: FontStyle.normal),
        labelSmall: TextStyle(fontStyle: FontStyle.normal),
        bodyLarge: TextStyle(fontStyle: FontStyle.normal),
        bodyMedium: TextStyle(fontStyle: FontStyle.normal),
        bodySmall: TextStyle(fontStyle: FontStyle.normal),
        // labelMedium: TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp),
        // headline5: TextStyle(
        //     fontWeight: FontWeight.w400,
        //     fontSize: 18,
        //     fontFamily: "SanFrancisco",
        //     color: Color.fromARGB(255, 70, 70, 70),
        //     height: 1.3),
        // headline1: TextStyle(
        //     color: AppColor.primaryColor,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 25,
        //     fontFamily: "SanFrancisco",
        //     height: 1.5),
      ));
}
