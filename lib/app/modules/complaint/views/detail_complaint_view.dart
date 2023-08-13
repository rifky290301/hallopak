import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/complaint_model.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';

import '../../../themes/widgets/app_decoration.dart';
import '../../../themes/widgets/app_header.dart';

class DetailComplaintView extends GetView {
  const DetailComplaintView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ComplaintModel model = Get.arguments;
    return Scaffold(
      body: Container(
        decoration: AppDecoration.appHeader,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader.appBack,
              AppHeader.appText('Detail Komplain'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.satpam!,
                      style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                    ),
                    const SizedBox(height: AppSize.micro),
                    Text(
                      model.warga!,
                      style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                    ),
                    const SizedBox(height: AppSize.medium),
                    Text(
                      model.judul!,
                      style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                    ),
                    const SizedBox(height: AppSize.micro),
                    Text(
                      model.deskripsi!,
                      style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                    ),
                    const SizedBox(height: AppSize.medium),
                    Text(
                      ConvertTime.convertDate(model.waktu!),
                      style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                    ),
                  ],
                ),
              ),
              const Center(child: Text('')),
            ],
          ),
        ),
      ),
    );
  }
}
