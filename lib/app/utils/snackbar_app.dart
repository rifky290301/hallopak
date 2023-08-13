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

Future successSnackbar(String message) async {
  return Get.snackbar(
    "Success",
    message,
    backgroundColor: AppColors.success,
    colorText: Colors.white,
    duration: const Duration(seconds: 5),
  );
}

Future infoSnackbar(String message) async {
  return Get.snackbar(
    "Info",
    message,
    backgroundColor: Colors.blue,
    colorText: Colors.white,
  );
}
