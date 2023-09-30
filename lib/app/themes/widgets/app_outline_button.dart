import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_text_style.dart';

class AppOutlineButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  // double radius = AppSize.micro;
  const AppOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? Colors.white),
        textStyle: MaterialStateProperty.all(TextStyle(color: textColor ?? AppColors.primary)),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: AppSize.semiSmall - 2)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.semiSmall),
            side: BorderSide(color: borderColor ?? AppColors.primary),
          ),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyle.textMedium.copyWith(color: textColor ?? AppColors.primary, fontSize: 16),
      ),
      onPressed: () {
        onPressed.call();
      },
    );
  }
}
