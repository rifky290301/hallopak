import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';
import 'package:hallopak/app/themes/widgets/app_see_list.dart';

import '../../../themes/widgets/app_decoration.dart';
import '../../../themes/widgets/app_header.dart';
import '../controllers/detail_complaint_controller.dart';

class DetailComplaintView extends GetView {
  const DetailComplaintView({Key? key}) : super(key: key);

  // @override
  // final _ = Get.put(DetailComplaintController());

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
              AppHeader.appText('Detail Komplain'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                child: GetBuilder<DetailComplaintController>(
                  init: Get.put(DetailComplaintController()),
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSeeList(name: 'Satpam', value: _.profileSatpam?.nama ?? ''),
                        const SizedBox(height: AppSize.micro),
                        AppSeeList(name: 'Warga', value: _.profileWarga?.nama ?? ''),
                        const SizedBox(height: AppSize.medium),
                        Text(
                          _.complaintModel?.judul ?? '',
                          style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.medium),
                        ),
                        Text(
                          _.complaintModel?.deskripsi ?? '',
                          style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                        ),
                        const SizedBox(height: AppSize.medium),
                        Text(
                          ConvertTime.convertDate(_.complaintModel?.waktu ?? Timestamp(0, 0)),
                          style: AppTextStyle.textMedium.copyWith(fontSize: AppSize.semiSmall),
                        ),
                      ],
                    );
                  },
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
