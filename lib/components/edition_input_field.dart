import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iburguer/assets/assets.dart';

class EditionInputField extends StatelessWidget {
  final String label;
  final double? fontSize;
  final bool done;
  final bool autoFocus;
  final double fieldPadding;
  final bool readOnly;
  final int? maxLength;
  final int? size;
  final TextInputType keyboardType;
  final bool regularText;
  final bool digitsOnly;
  final String? initialValue;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  EditionInputField(
      {required this.label,
      this.initialValue,
      this.fontSize,
      this.validation,
      this.onChanged,
      this.onFieldSubmitted,
      this.size,
      this.maxLength,
      this.keyboardType = TextInputType.multiline,
      this.digitsOnly = false,
      this.readOnly = false,
      this.regularText = true,
      this.fieldPadding = 15.0,
      this.autoFocus = false,
      this.done = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fieldPadding),
      child: TextFormField(
        initialValue: initialValue,
        inputFormatters:
            !digitsOnly ? null : [FilteringTextInputFormatter.digitsOnly],
        enableSuggestions: false,
        style: regularText
            ? AppTextStyles.regularText(size: fontSize)
            : AppTextStyles.header1Text,
        maxLength: maxLength,
        minLines: size,
        readOnly: readOnly,
        maxLines: null,
        enabled: true,
        autofocus: false,
        autocorrect: false,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: done ? TextInputAction.done : TextInputAction.next,
        autovalidateMode: AutovalidateMode.always,
        validator: validation,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          filled: true,
          fillColor:
              readOnly ? AppColors.disabledFillColor : AppColors.fillColor,
          focusColor: AppColors.badgeInactive,
          labelStyle: AppTextStyles.labelStyle,
          helperStyle: AppTextStyles.helperStyle,
          hintStyle: AppTextStyles.hintStyle,
          errorStyle: AppTextStyles.errorStyle,
          labelText: label,
          focusedBorder: AppStyles.defaultBorder,
          enabledBorder: AppStyles.defaultBorder,
          errorBorder: AppStyles.defaultBorder,
          focusedErrorBorder: AppStyles.defaultBorder,
          counterText: '',
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
