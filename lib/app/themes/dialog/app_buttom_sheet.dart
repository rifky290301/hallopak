import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_text_style.dart';
import '../widgets/app_button.dart';
import '../widgets/app_outline_button.dart';

class AppBottomSheet {
  static FutureOr<ImageSource> buildBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.small),
              topRight: Radius.circular(AppSize.small),
            ),
          ),
          backgroundColor: Colors.white,
          builder: (_) {
            return Container(
              height: 140,
              padding: const EdgeInsets.only(
                top: AppSize.semiSmall,
                left: AppSize.semiSmall,
                right: AppSize.semiSmall,
              ),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: AppSize.semiSmall),
                    decoration: BoxDecoration(
                      color: AppColors.textDisable,
                      borderRadius: BorderRadius.circular(AppSize.micro),
                    ),
                  ),
                  Text(
                    'Pilih Media',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textMedium.copyWith(fontSize: 14, color: AppColors.textEnable),
                  ),
                  const SizedBox(height: AppSize.semiSmall),
                  Row(
                    children: [
                      Expanded(
                        child: AppOutlineButton(
                          text: 'Galeri',
                          onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
                        ),
                      ),
                      const SizedBox(width: AppSize.small),
                      Expanded(
                        child: AppButton(
                          text: 'Camera',
                          onPressed: () => Navigator.of(context).pop(ImageSource.camera),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ) ??
        false;
  }
}
