import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';
import '../controllers/see_form_controller.dart';

class SeeFormView extends GetView<SeeFormController> {
  SeeFormView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SeeFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Kontrak Kerja'),
        centerTitle: true,
      ),
      body: GetBuilder<SeeFormController>(
        init: controller,
        builder: (_) {
          return _.agreementFormModel.alamatPenempatan != null
              ? Column(
                  children: [
                    Text(
                      'Satpam',
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    Text(
                      _.agreementFormModel.satpam ?? '',
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Pemberi Kerja',
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    Text(
                      _.agreementFormModel.warga ?? '',
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tanggal Mulai',
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    Text(
                      ConvertTime.convertTime(_.agreementFormModel.tanggalKontrakMulai!),
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tanggal Selesai',
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                    Text(
                      ConvertTime.convertTime(_.agreementFormModel.tanggalKontrakSelesai!),
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'Belum ada kontrak kerja',
                    style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                  ),
                );
        },
      ),
    );
  }
}
