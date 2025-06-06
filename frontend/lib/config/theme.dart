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
          fontSize: 16,
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
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      side: const WidgetStatePropertyAll(
        BorderSide(color: AppColors.grey300),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    constraints: BoxConstraints(
      maxWidth: kTextFieldSize.width,
      maxHeight: kTextFieldSize.height,
    ),
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey500,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 14.0.w),
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
      fontSize: 30,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: AppColors.grey900,
      fontWeight: FontWeight.w400,
    ),
  ),
);
