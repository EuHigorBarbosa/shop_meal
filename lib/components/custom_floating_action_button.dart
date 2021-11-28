import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final double scale;
  final IconData icon;
  final double iconSize;
  final Color bgColor;
  final Color fgColor;
  final bool isSaveButton;
  final Function()? onPressed;

  const CustomFloatingActionButton(
      {this.scale = 1.3,
      this.icon = Icons.add,
      this.iconSize = 45.0,
      this.bgColor = AppColors.grayButtonBG,
      this.fgColor = AppColors.grayButtonText,
      this.isSaveButton = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: scale,
        child: isSaveButton == false
            ? FloatingActionButton(
                child: Icon(
                  icon,
                  size: iconSize,
                ),
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onPressed: onPressed)
            : FloatingActionButton(
                child: Icon(
                  Icons.save_outlined,
                  size: iconSize,
                ),
                backgroundColor: AppColors.yellowButtonBG,
                foregroundColor: AppColors.yellowButtonText,
                onPressed: onPressed));
  }
}
