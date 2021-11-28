import 'dart:math';

import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late bool isLargeScreen;
  static late double smallerDimension;
  static late double badgeConstraints;
  static const double maxBodyWidth = 7.68; // 768px
  static const double maxBadgewidth = 3.6;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    isLargeScreen = safeBlockHorizontal >= maxBodyWidth;

    safeBlockHorizontal = min(safeBlockHorizontal, maxBodyWidth);
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    smallerDimension = min(safeBlockHorizontal, safeBlockVertical);
    badgeConstraints = min(smallerDimension, maxBadgewidth);
  }
}
