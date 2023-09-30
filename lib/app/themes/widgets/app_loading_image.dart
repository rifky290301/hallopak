import 'package:flutter/material.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';

Center appLoadingImage(ImageChunkEvent imageChunkEvent) {
  return Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
      value: imageChunkEvent.expectedTotalBytes != null
          ? imageChunkEvent.cumulativeBytesLoaded / imageChunkEvent.expectedTotalBytes!
          : null,
    ),
  );
}
