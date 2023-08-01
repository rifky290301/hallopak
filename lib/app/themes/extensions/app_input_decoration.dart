import 'package:flutter/material.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';

import 'app_text_style.dart';

class AppInputDecoration {
  static InputDecoration setDecoration(Widget? suffix, String hintText) {
    return InputDecoration(
      suffixIcon: suffix,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSize.small,
        vertical: AppSize.small,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        // borderSide: BorderSide(color: AppColors.primary, width: 2),
        borderSide: const BorderSide(color: Colors.transparent, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        borderSide: const BorderSide(color: Colors.transparent, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        borderSide: const BorderSide(color: Colors.transparent, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        borderSide: const BorderSide(color: Colors.transparent, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        borderSide: BorderSide(color: AppColors.danger, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        borderSide: BorderSide(color: AppColors.danger, width: 2),
      ),
      // fillColor: enabled == false ? AppColors.disabledTextfield : Colors.white,
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,

      hintStyle: AppTextStyle.textMedium.copyWith(color: AppColors.textDisable),
      errorStyle: AppTextStyle.textRegular.copyWith(color: AppColors.danger),
    );
  }
}
