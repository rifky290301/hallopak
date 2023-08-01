import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_text_style.dart';

class AppDropdownFormField extends StatelessWidget {
  final List<String> listItem;
  final String? selectedValue;
  final Function(String?)? onChanged;
  final String? hintText;
  final String? Function(String?)? validator;
  final double? paddingTop;
  final double? paddingBottom;

  const AppDropdownFormField({
    Key? key,
    required this.listItem,
    this.selectedValue,
    this.onChanged,
    this.hintText,
    this.validator,
    this.paddingTop,
    this.paddingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop ?? 0, bottom: paddingBottom ?? 0),
      width: Get.width,
      child: Material(
        shadowColor: BoxShadow(color: AppColors.primary.withOpacity(0.25)).color,
        elevation: 20,
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        child: DropdownButtonFormField(
          value: selectedValue,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyle.textBold.copyWith(color: AppColors.textDisable),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSize.small,
              vertical: AppSize.small,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.semiSmall),
              // borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderSide: const BorderSide(color: Colors.transparent, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.semiSmall),
              borderSide: const BorderSide(color: Colors.transparent, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.semiSmall),
              borderSide: const BorderSide(color: Colors.transparent, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.semiSmall),
              borderSide: const BorderSide(color: Colors.transparent, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.semiSmall),
              borderSide: BorderSide(color: AppColors.danger, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.semiSmall),
              borderSide: BorderSide(color: AppColors.danger, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: AppTextStyle.textRegular.copyWith(color: AppColors.danger),
          ),
          dropdownColor: Colors.white,
          focusColor: AppColors.primary,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppSize.micro),
          onChanged: (String? newValue) {
            onChanged!(newValue);
          },
          items: listItem.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.textMedium.copyWith(
                  color: AppColors.textEnable,
                  fontSize: 12,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
