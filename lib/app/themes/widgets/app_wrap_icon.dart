import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';

import '../constants/app_gradients.dart';

class AppWrapIcon {
  static Container appWrapIcon(IconData icon, String route) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.small),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(20, 788, 90, 0.2),
            spreadRadius: 0,
            blurRadius: 50,
            offset: Offset(11, 28),
          ),
        ],
      ),
      child: IconButton(
        icon: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) => AppGradients.primary.createShader(bounds),
          child: Icon(icon),
        ),
        onPressed: () => Get.toNamed(route),
      ),
    );
  }
}
