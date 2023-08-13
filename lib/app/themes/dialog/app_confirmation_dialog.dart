import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_text_style.dart';
import '../widgets/app_button.dart';
import '../widgets/app_outline_button.dart';

class AppConfirmationDialog {
  static Future<bool> show(
    BuildContext context, {
    required String message,
    String? textCancel,
    String? textAgree,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(AppSize.medium),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.small),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textMedium.copyWith(fontSize: 14, color: AppColors.textEnable),
                    ),
                    const SizedBox(height: AppSize.semiSmall),
                    Row(
                      children: [
                        Expanded(
                          child: AppOutlineButton(
                            text: textCancel ?? 'Batal',
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                        ),
                        const SizedBox(width: AppSize.small),
                        Expanded(
                          child: AppButton(
                            text: textAgree ?? 'Keluar',
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }
}
