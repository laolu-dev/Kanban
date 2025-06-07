import 'dart:ui';

import 'package:kanban/core/utils/extensions.dart';


final double useSpaceOf2 = 2.0;

final double useSpaceOf4 = 4.0;

final double useSpaceOf6 = 6.0;

final double useSpaceOf8 = 8.0;

final double useSpaceOf12 = 12.0;

final double useSpaceOf14 = 14.0;

final double useSpaceOf16 = 16.0;

final double useSpaceOf18 = 18.0;

final double useSpaceOf20 = 20.0;

final double useSpaceOf22 = 22.0;

final double useSpaceOf24 = 24.0;

final double useSpaceOf28 = 28.0;

final double useSpaceOf30 = 30.0;

final double useSpaceOf32 = 32.0;

final double useSpaceOf64 = 64.0;

final double kNavigationRailWidth = 280.0.w;

final Size kButtonSize = Size(360.0.w, 48.0.h);

final Size kTextFieldSize = Size(360.0.w, 44.0.h);

final Size kSearchTextFieldSize = Size(400.0.w, 44.0.h);

class RunningDeviceInfo {
  RunningDeviceInfo._();
  static final RunningDeviceInfo _instance = RunningDeviceInfo._();
  static RunningDeviceInfo get instance => _instance;

  late double _width;

  late double _height;

  double get width => _width;

  double get height => _height;

  set setHeight(double deviceHeight) {
    _height = deviceHeight;
  }

  set setWidth(double deviceWidth) {
    _width = deviceWidth;
  }
}
