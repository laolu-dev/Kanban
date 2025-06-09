import 'package:flutter/material.dart';
import 'package:kanban/config/gen/colors.gen.dart' show AppColors;
import 'package:kanban/config/gen/fonts.gen.dart' show FontFamily;
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

final ThemeData theme = ThemeData(
  fontFamily: FontFamily.inter,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: const ColorScheme.light(primary: AppColors.primary600),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStatePropertyAll(kButtonSize),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10.0.h)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16.0.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        return states.contains(WidgetState.disabled)
            ? AppColors.grey400
            : AppColors.primary600;
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.r)),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStatePropertyAll(kButtonSize),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10.0.h)),
      foregroundColor: WidgetStatePropertyAll(AppColors.grey700),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      side: const WidgetStatePropertyAll(
        BorderSide(color: AppColors.grey300),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
      ),
    ),
  ),
 
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    constraints: BoxConstraints(
      maxWidth: kTextFieldSize.width,
      minHeight: kTextFieldSize.height,
    ),
    hintStyle: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.grey500,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey300),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary500),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 30.0.sp,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 24.0.sp,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0.sp,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0.sp,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0.sp,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0.sp,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
  ),
);
