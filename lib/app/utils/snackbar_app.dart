import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';

Future errorSnackbar(String message) async {
  return Get.snackbar(
    "Error",
    message,
    backgroundColor: AppColors.danger,
    colorText: Colors.white,
  );
}
