import 'package:flutter/material.dart';
import 'package:iburguer/config/config.dart';

import '../../assets/colors/colors.dart';

class AppRectangularButton extends StatelessWidget {
  final bool yellowButton;
  final bool blackButton;
  final bool redButton;
  final String text;
  final double fontSize;
  final bool extended;
  final double verticalTextPadding;
  final double horizontalTextPadding;
  final double? verticalButtonPadding;
  final double? horizontalButtonPadding;
  final IconData? icon;
  final double? iconSize;
  final GestureTapCallback? onPressed;

  const AppRectangularButton({
    required this.text,
    this.fontSize = 18.0,
    this.icon,
    this.iconSize = 32.0,
    this.extended = false,
    this.yellowButton = false,
    this.blackButton = false,
    this.redButton = false,
    this.verticalTextPadding = 15.0,
    this.horizontalTextPadding = 20.0,
    this.verticalButtonPadding,
    this.horizontalButtonPadding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return extended == false ? appButton : stretchedButton;
  }

  get appButton => paddedButton(
          child: ElevatedButton(
        style: buttonStyle,
        child: child,
        onPressed: this.onPressed,
      ));

  get stretchedButton => paddedButton(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [appButton],
      ));

  Padding paddedButton({required Widget child}) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: this.verticalButtonPadding ?? 0.0,
          horizontal: horizontalButtonPadding ?? 0.0),
      child: child);

  get bgColor => this.yellowButton == true
      ? AppColors.yellowButtonBG
      : this.blackButton == true
          ? AppColors.blackButtonBG
          : this.redButton == true
              ? AppColors.redButtonBG
              : AppColors.grayButtonBG;

  get fgColor => this.yellowButton == true
      ? AppColors.yellowButtonText
      : this.blackButton == true
          ? AppColors.blackButtonText
          : this.redButton == true
              ? AppColors.redButtonText
              : AppColors.grayButtonText;

  get buttonText => Text(
        this.text,
        style: TextStyle(
          fontFamily: "Button",
          fontSize: this.fontSize,
          fontWeight: FontWeight.w400,
          color: fgColor,
        ),
      );

  get child {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            this.icon,
            size: this.iconSize,
            color: fgColor,
          ),
          SizedBox(
            width: 5.0,
          ),
          buttonText,
        ],
      );
    } else {
      return buttonText;
    }
  }

  get buttonStyle => ButtonStyle(
        enableFeedback: true,
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                vertical: SizeConfig.isLargeScreen
                    ? this.verticalTextPadding * 1.2
                    : this.verticalTextPadding,
                horizontal: this.horizontalTextPadding)),
        splashFactory: InkRipple.splashFactory,
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        foregroundColor: MaterialStateProperty.all<Color>(fgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
}
