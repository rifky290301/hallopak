import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';

class DetailSatpamView extends GetView {
  const DetailSatpamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.appHeader,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader.appBack,
              AppHeader.appText('Detail Satpam'),
              Image.asset(
                'assets/images/image/photo_profile.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              Text('Nama Satpam', style: AppTextStyle.textMedium.copyWith(fontSize: 24)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
