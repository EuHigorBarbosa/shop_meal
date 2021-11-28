import 'package:flutter/material.dart';
import 'package:iburguer/assets/styles/text_styles.dart';
import 'package:iburguer/assets/assets.dart';
//! por que o correto não é import 'package:iburguer/lib/assets/assets.dart';
//! não entendo a necessidade dessa palavra package

class TextFormatter {
  static RichText boldThenRegular(
      {required String bold, required String regular, double? size}) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: bold,
            style: AppTextStyles.boldText(size: size),
          ),
          TextSpan(
            text: regular,
            style: AppTextStyles.regularText(size: size),
          ),
        ],
      ),
    );
  }

  static List<Widget> scaleTextConstructor(Map scale) {
    return scale.entries
        .map((entry) =>
            boldThenRegular(bold: '${entry.key} - ', regular: '${entry.value}'))
        .toList();
  }
}
