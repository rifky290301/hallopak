import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class AppLoadingDialog {
  static final AppLoadingDialog _instance = AppLoadingDialog._internal();
  AppLoadingDialog._internal();
  factory AppLoadingDialog() => _instance;

  static Future show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(AppSize.small),
              ),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
          ),
        );
      },
    );
  }

  static void close(BuildContext context) {
    return Navigator.pop(context);
  }
}
