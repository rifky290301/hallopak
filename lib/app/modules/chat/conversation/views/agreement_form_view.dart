import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/modules/chat/conversation/controllers/agreement_form_controller.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_date_field.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_money_input.dart';
import 'package:hallopak/app/themes/widgets/app_time_field.dart';
import 'package:hallopak/app/utils/check_digit.dart';

import '../../../../themes/constants/app_colors.dart';
import '../../../../themes/constants/app_size.dart';
import '../../../../themes/extensions/app_text_style.dart';
import '../../../../themes/widgets/app_text_form_field.dart';
import '../../../../utils/form_validator.dart';

class AgreementFormView extends GetView<AgreementFormController> {
  AgreementFormView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(AgreementFormController());
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
              AppHeader.appText('Form Persetujuan'),
              Expanded(
                child: Form(
                  key: controller.globarKey,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: AppSize.medium, right: AppSize.medium, bottom: AppSize.medium),
                    children: [
                      Text(
                        'Form Persetujuan',
                        style: AppTextStyle.textMedium.copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(height: AppSize.semiLarge),
                      Text('Nama Warga', style: AppTextStyle.textMedium),
                      AppTextFormField(
                        controller: controller.wargaTEC!,
                        hintText: 'Nama Warga',
                        validator: FormValidator.commonString,
                        paddingBottom: AppSize.small,
                        paddingTop: AppSize.micro / 2,
                      ),
                      Text('Nama Satpam', style: AppTextStyle.textMedium),
                      AppTextFormField(
                        controller: controller.satpamTEC!,
                        hintText: 'Nama Satpam',
                        validator: FormValidator.commonString,
                        paddingBottom: AppSize.small,
                        paddingTop: AppSize.micro / 2,
                      ),
                      Text('Alamat Penempatan', style: AppTextStyle.textMedium),
                      AppTextFormField(
                        controller: controller.alamatTEC!,
                        hintText: 'Alamat Penempatan',
                        validator: FormValidator.commonString,
                        paddingBottom: AppSize.small,
                        paddingTop: AppSize.micro / 2,
                      ),
                      Text('Tanggal Awal', style: AppTextStyle.textMedium),
                      AppDateField(
                        controller: controller.tanggalKontrakMulaiTEC!,
                        hintText: 'Tanggal Kontrak Mulai',
                        paddingBottom: AppSize.small,
                        paddingTop: AppSize.micro / 2,
                        onSelectedDate: (DateTime? date) {
                          controller.tanggalKontrakMulaiTEC!.text = '${date!.day} - ${date.month} - ${date.year}';
                          controller.tanggalKontrakMulai = Timestamp.fromDate(date);
                        },
                      ),
                      Text('Tanggal Selesai', style: AppTextStyle.textMedium),
                      AppDateField(
                        controller: controller.tanggalKontrakSelesaiTEC!,
                        hintText: 'Tanggal Kontrak Selesai',
                        paddingBottom: AppSize.small,
                        paddingTop: AppSize.micro / 2,
                        onSelectedDate: (DateTime? date) {
                          controller.tanggalKontrakSelesaiTEC!.text = '${date!.day} - ${date.month} - ${date.year}';
                          controller.tanggalKontrakSelesai = Timestamp.fromDate(date);
                        },
                      ),
                      // Text('Jam Kerja', style: AppTextStyle.textMedium),
                      // AppTextFormField(
                      //   controller: controller.jamKerjaTEC!,
                      //   hintText: 'Jam Kerja',
                      //   keyboardType: TextInputType.number,
                      //   validator: FormValidator.commonString,
                      //   paddingBottom: AppSize.small,
                      //   paddingTop: AppSize.micro / 2,
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Jam Kerja Mulai', style: AppTextStyle.textMedium),
                                AppTimeField(
                                  controller: controller.jamKerjaMulaiTEC!,
                                  hintText: 'Jam Kerja Mulai',
                                  paddingBottom: AppSize.small,
                                  paddingTop: AppSize.micro / 2,
                                  onSelectedTime: (TimeOfDay? date) {
                                    controller.jamKerjaMulaiTEC!.text =
                                        '${tambahkanNolDiDepan(date!.hour)} : ${tambahkanNolDiDepan(date.minute)}';
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppSize.micro),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Jam Kerja Berakhir', style: AppTextStyle.textMedium),
                                AppTimeField(
                                  controller: controller.jamKerjaBerakhirTEC!,
                                  hintText: 'Jam Kerja Berakhir',
                                  paddingBottom: AppSize.small,
                                  paddingTop: AppSize.micro / 2,
                                  onSelectedTime: (TimeOfDay? date) {
                                    controller.jamKerjaBerakhirTEC!.text =
                                        '${tambahkanNolDiDepan(date!.hour)} : ${tambahkanNolDiDepan(date.minute)}';
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text('Gaji', style: AppTextStyle.textMedium),
                      AppMonayInput(
                        controller: controller.gajiTEC!,
                        hintText: 'Gaji',
                        paddingBottom: AppSize.small,
                        paddingTop: AppSize.micro / 2,
                        onChanged: (text) {},
                      ),
                      const SizedBox(height: AppSize.large),
                      SizedBox(
                        width: Get.width,
                        child: Center(
                          child: AppButton(
                            text: 'Kirim',
                            onPressed: () {
                              if (controller.globarKey.currentState!.validate()) {
                                controller.addForm();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
