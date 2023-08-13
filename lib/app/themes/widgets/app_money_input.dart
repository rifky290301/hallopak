import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:intl/intl.dart';

import '../constants/app_size.dart';
import '../extensions/app_input_decoration.dart';

class AppMonayInput extends StatelessWidget {
  final String hintText;
  final double? paddingTop;
  final double? paddingBottom;
  final TextEditingController controller;
  final Function(String) onChanged;
  const AppMonayInput({
    Key? key,
    this.hintText = 'text',
    this.paddingTop,
    this.paddingBottom,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  String currencyPrice(String textFieldValue) {
    double value = double.parse(textFieldValue);
    final money = NumberFormat.currency(
      locale: "id",
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return money.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0, bottom: paddingBottom ?? 0),
      child: Material(
        shadowColor: BoxShadow(color: AppColors.primary.withOpacity(0.25)).color,
        elevation: 20,
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        child: TextFormField(
          controller: controller,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, CurrencyIdInputFormatter()],
          keyboardType: TextInputType.number,
          onChanged: (text) {
            onChanged.call(text);
          },
          decoration: AppInputDecoration.setDecoration(null, hintText),
        ),
      ),
    );
  }
}

class CurrencyIdInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,###,###", "id_ID");
    String newText = "Rp ${formatter.format(value)}";

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: newText.length));
  }
}
