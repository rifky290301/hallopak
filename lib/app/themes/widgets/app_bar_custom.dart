import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';

AppBar appBarCustom({required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    automaticallyImplyLeading: false,
    // tiga baris diatas untuk membuat appbar transparan
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.small),
            color: const Color(0xFFF9A84D),
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFFDA6317),
            ),
          ),
        ),
        Text(title, style: AppTextStyle.textMedium),
        const SizedBox(width: 45, height: 45),
      ],
    ),
  );
}
