import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:kanban/core/constants/constants.dart';

const int _designWidth = 1440;

const int _designHeight = 960;

final double _scaleWidth = (RunningDeviceInfo.instance.width / _designWidth);

final double _scaleHeight = (RunningDeviceInfo.instance.height / _designHeight);

extension BuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  FilledButtonThemeData get filledButtonTheme =>
      Theme.of(this).filledButtonTheme;
}

extension DoubleExtension on double {
  double get h => this * _scaleHeight;

  double get w => this * _scaleWidth;

  double get sp => this * min(_scaleWidth, _scaleHeight);

  double get r => this * min(_scaleWidth, _scaleHeight);

  SizedBox get verticalSpacing => SizedBox(height: this);

  SizedBox get horizontalSpacing => SizedBox(width: this);
}
