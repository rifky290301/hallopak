import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';

class AppHeader {
  static Container get appBack => Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.only(left: AppSize.medium, top: AppSize.medium, bottom: AppSize.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.small),
          color: const Color(0xFFFDF5ED),
        ),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFFDA6317),
          ),
        ),
      );

  static Padding appText(String text, {double? paddingbottom}) {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.medium, bottom: paddingbottom ?? AppSize.medium),
      child: Text(
        text,
        style: AppTextStyle.textBold.copyWith(fontSize: 24),
      ),
    );
  }

  Container appButton({required IconData icon, required Function() onPressed}) {
    return Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.only(left: AppSize.medium, top: AppSize.medium, bottom: AppSize.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.small),
        color: const Color(0xFFFDF5ED),
      ),
      child: IconButton(
        onPressed: () => onPressed,
        icon: Icon(
          icon,
          color: const Color(0xFFDA6317),
        ),
      ),
    );
  }
}
