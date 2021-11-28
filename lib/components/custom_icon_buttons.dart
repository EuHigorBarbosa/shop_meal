import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iburguer/assets/assets.dart';

class CustomIconButtons {
  static IconButton menuInicial(
      {Color? color,
      double? size,
      bool isActive = true,
      required Function()? onPressed}) {
    return IconButton(
        icon: Icon(
          IconsApp.IconButtonMenu,
        ),
        disabledColor: AppColors.grayButtonBG,
        color: isActive ? AppColors.cardBG : AppColors.grayButtonBG,
        iconSize: size ?? 20,
        onPressed: onPressed);
  }

  static IconButton setaVoltar(
      {Color? color,
      double? size,
      bool isActive = true,
      required Function()? onPressed}) {
    return IconButton(
        icon: Icon(
          IconsApp.iconButtonArrow_left,
        ),
        disabledColor: AppColors.grayButtonBG,
        color: isActive ? AppColors.cardBG : AppColors.grayButtonBG,
        iconSize: size ?? 35,
        onPressed: onPressed);
  }

  static IconButton closeButton(
      {Color? color, double? size, Function()? onPressed}) {
    return IconButton(
        icon: Icon(
          IconsApp.iconButtonClose,
        ),
        onPressed: onPressed ??
            () {
              if (Get.currentRoute.isNotEmpty == true) {
                Get.back();
              }
            });
  }

  static IconButton backArrow(
      {bool yellow = true, double? size, Function()? onPressed}) {
    return IconButton(
        icon: Icon(
          IconsApp.iconButtonArrow_left,
        ),
        disabledColor: AppColors.footerBG,
        color: yellow ? AppColors.appBarYellowIcon : Colors.white,
        iconSize: size ?? 35,
        onPressed: onPressed);
  }

  static IconButton forwardArrow(
      {Color? color,
      double? size,
      bool isActive = true,
      required Function()? onPressed}) {
    return IconButton(
        icon: Icon(
          IconsApp.iconButtonArrow_right,
        ),
        disabledColor: AppColors.grayButtonBG,
        color: isActive ? AppColors.appBarYellowIcon : AppColors.grayButtonBG,
        iconSize: size ?? 35,
        onPressed: onPressed);
  }
}
