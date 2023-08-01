import 'package:flutter/material.dart';
import 'package:hallopak/app/themes/constants/app_gradients.dart';

import '../constants/app_size.dart';
import '../extensions/app_text_style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  double radius = AppSize.micro;
  AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(gradient: AppGradients.primary),
    //   child: ElevatedButton(
    //     style: ButtonStyle(
    //       backgroundColor: MaterialStateProperty.all(Colors.transparent),
    //       textStyle: MaterialStateProperty.all(TextStyle(color: textColor ?? Colors.white)),
    //       padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: AppSize.small)),
    //       shape: MaterialStateProperty.all(
    //         RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(radius),
    //         ),
    //       ),
    //     ),
    //     child: Text(text, style: AppTextStyle.textBold.copyWith(color: textColor ?? Colors.white)),
    //     onPressed: () {
    //       onPressed.call();
    //     },
    //   ),
    // );
    return Container(
      height: 44.0,
      width: width ?? 156,
      decoration: BoxDecoration(
        gradient: AppGradients.primary,
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
        child: Text(text, style: AppTextStyle.textBold.copyWith(color: textColor ?? Colors.white, fontSize: 16)),
        onPressed: () {
          onPressed.call();
        },
      ),
    );
  }
}