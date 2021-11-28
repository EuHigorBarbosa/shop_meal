import 'package:flutter/material.dart';

import '../colors/colors.dart';
import './text_styles.dart';

class AppStyles {
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.appBarBG,
    foregroundColor: Colors.white,
    elevation: 4.0,
    iconTheme: IconThemeData(color: AppColors.appBarFG, size: 30.0),
    actionsIconTheme: IconThemeData(color: AppColors.appBarFG, size: 30.0),
    titleTextStyle: AppTextStyles.appBarText,
    centerTitle: true,
  );

  static const BottomNavigationBarThemeData bottomNavTheme =
      BottomNavigationBarThemeData(
    backgroundColor: AppColors.footerBG,
    selectedIconTheme:
        IconThemeData(color: AppColors.footerActiveIcons, size: 30.0),
    unselectedIconTheme:
        IconThemeData(color: AppColors.footerInactiveIcons, size: 30.0),
    showSelectedLabels: false,
    showUnselectedLabels: false,
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    alignLabelWithHint: true,
    labelStyle: AppTextStyles.labelStyle,
    helperStyle: AppTextStyles.helperStyle,
    hintStyle: AppTextStyles.hintStyle,
    errorStyle: AppTextStyles.errorStyle,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    isDense: true,
    contentPadding: const EdgeInsets.all(5.0),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 1.0, color: AppColors.formBorder)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(width: 1.5, color: AppColors.focusedBorder),
    ),
  );

  static final ButtonThemeData buttonTheme = ButtonThemeData(
      colorScheme: ColorScheme.light(
          primary: AppColors.grayButtonBG,
          secondary: AppColors.yellowButtonBG,
          onBackground: AppColors.grayButtonBG),
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.grayButtonBG,
      disabledColor: AppColors.grayButtonBG,
      splashColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ));

  static final OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(
      color: AppColors.badgeInactive,
      width: 3.0,
    ),
  );
}
