import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_input_decoration.dart';
import '../extensions/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final double? paddingTop;
  final double? paddingBottom;
  final Widget? suffix;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool? isRequired;
  final TextInputType? keyboardType;
  final int? maxLength;
  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputAction,
    this.paddingTop,
    this.paddingBottom,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.enabled,
    this.isRequired,
    this.keyboardType,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0, bottom: paddingBottom ?? 0),
      // padding: EdgeInsets.zero,
      child: Material(
        shadowColor: BoxShadow(color: AppColors.primary.withOpacity(0.25)).color,
        elevation: 20,
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        child: TextFormField(
          // maxLength: maxLength,
          // inputFormatters: [if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly],
          textInputAction: textInputAction ?? TextInputAction.next,
          enabled: enabled ?? true,
          obscureText: obscureText,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          decoration: AppInputDecoration.setDecoration(suffix, hintText),
          style: AppTextStyle.textMedium,
          controller: controller,
        ),
      ),
    );
  }
}
