import 'package:flutter/material.dart';
import '../../assets/assets.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final double? padding;
  final bool bottomBorder;
  final double radius;

  const CustomCard(
      {required this.child,
      this.enabled = true,
      this.padding,
      this.bottomBorder = false,
      this.radius = 10.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding ?? 10.0),
        decoration: BoxDecoration(
            color: enabled ? AppColors.cardBG : AppColors.menuInactive,
            border: bottomBorder
                ? Border.all(color: AppColors.formBorder, width: 3.0)
                : null,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                  blurRadius: 2,
                  color: Colors.black54)
            ],
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: child);
  }
}
