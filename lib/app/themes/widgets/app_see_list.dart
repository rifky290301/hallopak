import 'package:flutter/material.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';

class AppSeeList extends StatelessWidget {
  final int? flexName;
  final int? flexValue;
  final String name;
  final String value;
  const AppSeeList({
    super.key,
    this.flexName,
    this.flexValue,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: flexName ?? 5,
          child: Text(
            name,
            style: AppTextStyle.textMedium.copyWith(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: flexValue ?? 7,
          child: Text(
            ': $value',
            style: AppTextStyle.textMedium.copyWith(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
