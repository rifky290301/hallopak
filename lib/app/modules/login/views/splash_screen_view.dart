import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/routes/app_pages.dart';

import '../../../themes/constants/app_colors.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final double _width = 120.0;
  final double _height = 120.0;
  final double _radius = 30.0;
  final double _heightImage = 80.0;

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.LOGIN);
        // if (box.read(StorageVar.userModel) == null) {
        //   Get.offAllNamed(Routes.LOGIN);
        // } else {
        //   Get.offAllNamed(Routes.HOME);
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        // child: AnimatedContainer(
        //   width: _width,
        //   height: _height,
        //   duration: const Duration(milliseconds: 3000),
        //   curve: Curves.fastOutSlowIn,
        //   padding: const EdgeInsets.all(20),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(_radius),
        //   ),
        //   child: Image.asset(
        //     'assets/images/logo/logo_simpel.png',
        //     height: _heightImage,
        //   ),
        // ),
        child: Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_radius),
          ),
          // child: SvgPicture.asset(
          //   'assets/images/logo/logo_s_simpel.svg',
          //   height: _heightImage,
          // ),
          child: Image.asset(
            'assets/images/logo/logo_simpel.png',
            height: _heightImage,
          ),
        ),
      ),
    );
  }
}
