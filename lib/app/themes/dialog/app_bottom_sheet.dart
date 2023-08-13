import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_text_style.dart';
import '../widgets/app_button.dart';
import '../widgets/app_outline_button.dart';

Future<ImageSource> buildBottomSheetCustom(BuildContext context) async {
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
        height: 120,
        padding: const EdgeInsets.only(
          top: AppSize.semiSmall,
          left: AppSize.semiSmall,
          right: AppSize.semiSmall,
        ),
        child: Column(
          children: [
            Text(
              'Pilih unggah foto?',
              textAlign: TextAlign.center,
              style: AppTextStyle.textMedium.copyWith(fontSize: 14, color: AppColors.textEnable),
            ),
            const SizedBox(height: AppSize.semiSmall),
            Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    text: 'Kamera',
                    // onPressed: () => Navigator.of(context).pop(false),
                    onPressed: () => Navigator.of(context).pop(ImageSource.camera),
                  ),
                ),
                const SizedBox(width: AppSize.small),
                Expanded(
                  child: AppButton(
                    text: 'Gallery',
                    // onPressed: () => Navigator.of(context).pop(true),
                    onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
