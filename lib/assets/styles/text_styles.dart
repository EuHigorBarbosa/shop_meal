import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTextStyles {
  static const String _fontFamilyText = 'Text';
  static const String _fontFamilyBold = 'BoldText';
  static const String _fontFamilyTitle = 'Title';
  static const String _fontFamilyButton = 'Button';

  static const _textSizeHuge = 24.0;
  static const _textSizeLarge = 20.0;
  static const _textSizeDefault = 16.0;
  static const _textSizeSmall = 14.0;
  static const _textSizeTiny = 12.0;

  static const FontWeight _titleWeight = FontWeight.w400;
  static const FontWeight _regularWeight = FontWeight.w300;
  static const FontWeight _boldWeight = FontWeight.w500;
  static const FontWeight _buttonWeight = FontWeight.w400;

  static const appBarText = TextStyle(
      fontFamily: _fontFamilyTitle,
      fontSize: _textSizeLarge,
      fontWeight: _titleWeight,
      color: AppColors.appBarFG);

  static const category_Widget = TextStyle(
      fontFamily: _fontFamilyTitle,
      fontSize: 20.0,
      fontWeight: _regularWeight,
      color: AppColors.tileOfGrid);

  static const meal_WidgetTextStyle = TextStyle(
      fontFamily: _fontFamilyTitle,
      fontSize: 26.0,
      fontWeight: _regularWeight,
      color: AppColors.titleOfMealCard);

  ///================
  static const appBarYellowText = TextStyle(
      fontFamily: _fontFamilyTitle,
      fontSize: 20.0,
      fontWeight: _titleWeight,
      color: AppColors.yellowTitle);

  static const header1Text = TextStyle(
    fontFamily: _fontFamilyTitle,
    fontSize: 20.0,
    fontWeight: _titleWeight,
    color: AppColors.titleText,
  );

  static const header2Text = TextStyle(
    fontFamily: _fontFamilyBold,
    fontSize: 16.0,
    fontWeight: _boldWeight,
    color: AppColors.regularText,
  );

  static const header3Text = TextStyle(
    fontFamily: _fontFamilyBold,
    fontSize: 13.0,
    fontWeight: _boldWeight,
    color: AppColors.regularText,
  );

  static const labelStyle = TextStyle(
    fontFamily: _fontFamilyTitle,
    fontSize: 20.0,
    fontWeight: _titleWeight,
    color: AppColors.regularText,
  );

  static const helperStyle = TextStyle(
    fontFamily: _fontFamilyText,
    fontSize: 15.0,
    fontWeight: _regularWeight,
    color: AppColors.regularText,
  );

  static const hintStyle = TextStyle(
    fontFamily: _fontFamilyText,
    fontSize: 16.0,
    fontWeight: _regularWeight,
    color: AppColors.textBoxPlaceholder,
  );

  static const appBarHhintStyle = TextStyle(
    fontFamily: _fontFamilyText,
    fontSize: 16.0,
    fontWeight: _regularWeight,
    color: AppColors.appBarHintColor,
  );
  static const errorStyle = TextStyle(
    fontFamily: _fontFamilyBold,
    fontSize: 13.0,
    fontWeight: _boldWeight,
    color: AppColors.errorText,
  );

  static TextStyle regularTitle({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyTitle,
      fontSize: size ?? _textSizeLarge,
      fontWeight: _titleWeight,
      color: color ?? AppColors.titleText,
    );
  }

  static TextStyle boldTitle({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyTitle,
      fontSize: size ?? _textSizeLarge,
      fontWeight: _boldWeight,
      color: color ?? AppColors.titleText,
    );
  }

  static TextStyle regularText({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyText,
      fontSize: size ?? _textSizeSmall,
      fontWeight: _regularWeight,
      color: color ?? AppColors.regularText,
    );
  }

  static TextStyle boldText({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyBold,
      fontSize: size ?? _textSizeDefault,
      fontWeight: _boldWeight,
      color: color ?? AppColors.regularText,
    );
  }

  static TextStyle greyButtonText({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyButton,
      fontSize: size ?? _textSizeDefault,
      fontWeight: _buttonWeight,
      color: color ?? AppColors.grayButtonText,
    );
  }

  static TextStyle yellowButtonText({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyButton,
      fontSize: size ?? _textSizeDefault,
      fontWeight: _buttonWeight,
      color: color ?? AppColors.yellowButtonText,
    );
  }

  static TextStyle linkText({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyText,
      fontSize: size ?? _textSizeDefault,
      fontWeight: _regularWeight,
      color: AppColors.linkText,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle helpTitle({double? size, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamilyText,
      fontSize: size ?? _textSizeHuge,
      fontWeight: _titleWeight,
      color: color ?? AppColors.titleText,
    );
  }

  static TextStyle badgeText({double? size, bool active = false}) {
    return TextStyle(
      fontFamily: _fontFamilyBold,
      fontSize: size ?? _textSizeDefault,
      fontWeight: _boldWeight,
      color: active ? Colors.white : AppColors.badgeInactive,
    );
  }

  static final TextStyle smallText = TextStyle(
    fontFamily: _fontFamilyBold,
    fontSize: _textSizeSmall,
    fontWeight: _boldWeight,
    color: AppColors.regularText,
  );

  static final TextStyle tinyBoldText = TextStyle(
    fontFamily: _fontFamilyBold,
    fontSize: _textSizeTiny,
    fontWeight: _boldWeight,
    color: AppColors.regularText,
  );
  static final TextStyle tinyText = TextStyle(
    fontFamily: _fontFamilyText,
    fontSize: _textSizeTiny,
    fontWeight: _regularWeight,
    color: AppColors.regularText,
  );

  static final TextStyle smallUnderlined = TextStyle(
    fontFamily: _fontFamilyBold,
    fontSize: _textSizeSmall,
    fontWeight: _boldWeight,
    color: AppColors.regularText,
    decoration: TextDecoration.underline,
  );
}
