import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_input_decoration.dart';
import '../extensions/app_text_style.dart';

class AppTimeField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? paddingTop;
  final double? paddingBottom;
  final Widget? suffix;
  final bool? isRequired;
  final TextInputType? keyboardType;

  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(TimeOfDay)? onSelectedTime;
  const AppTimeField({
    Key? key,
    required this.controller,
    required this.hintText,
    // this.textInputAction,
    this.paddingTop,
    this.paddingBottom,
    this.suffix,
    // this.obscureText = false,
    // this.validator,
    // this.enabled,
    this.isRequired,
    this.keyboardType,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onSelectedTime,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0, bottom: paddingBottom ?? 0),
      child: Material(
        shadowColor: BoxShadow(color: AppColors.primary.withOpacity(0.25)).color,
        elevation: 20,
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        child: TextFormField(
          // textInputAction: textInputAction ?? TextInputAction.next,
          // enabled: enabled ?? true,
          // obscureText: obscureText,
          keyboardType: keyboardType ?? TextInputType.text,
          // validator: validator,
          readOnly: true,
          decoration: AppInputDecoration.setDecoration(suffix, hintText).copyWith(
            suffixIcon: IconButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 0, minute: 0),
                  confirmText: "Oke",
                  cancelText: "Batal",
                  // initialDate: initialDate ?? DateTime.now(),
                  // firstDate: firstDate ?? DateTime(1900),
                  // lastDate: lastDate ?? DateTime(2100),

                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: AppColors.primary,
                          // onPrimary: Colors.white,
                          // surface: AppColors.primary,
                          // onSurface: Colors.black,
                        ),
                        // dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                ).then((value) {
                  if (value != null) {
                    onSelectedTime!(value);
                  }
                });
              },
              icon: const Icon(Icons.access_time_rounded),
            ),
          ),
          style: AppTextStyle.textMedium,
          controller: controller,
        ),
      ),
    );
  }
}
