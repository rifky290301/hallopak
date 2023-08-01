import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';

import '../controllers/slpash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset(
            'assets/images/logo/logo_hallopak.png',
            height: 80,
          ),
        ),
      ),
    );
  }
}
