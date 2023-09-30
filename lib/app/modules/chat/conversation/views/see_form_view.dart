import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/dialog/app_confirmation_dialog.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_see_list.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';
import '../controllers/see_form_controller.dart';

class SeeFormView extends GetView<SeeFormController> {
  SeeFormView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SeeFormController());

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
              AppHeader.appText('Form Kontrak'),
              Expanded(
                child: GetBuilder<SeeFormController>(
                  init: controller,
                  builder: (_) {
                    return _.agreementFormModel?.alamatPenempatan != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: AppSize.medium),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSeeList(name: 'Satpam', value: _.agreementFormModel?.satpam ?? ''),
                                const SizedBox(height: 20),
                                AppSeeList(name: 'Pemberi Kerja', value: _.agreementFormModel?.warga ?? ''),
                                const SizedBox(height: 20),
                                AppSeeList(
                                  name: 'Tanggal Mulai',
                                  value: ConvertTime.convertDate(
                                    _.agreementFormModel?.tanggalKontrakMulai! ?? Timestamp(0, 0),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                AppSeeList(
                                  name: 'Tanggal Selesai',
                                  value: ConvertTime.convertDate(
                                    _.agreementFormModel?.tanggalKontrakSelesai! ?? Timestamp(0, 0),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                AppSeeList(
                                    name: 'Jam Kerja',
                                    value:
                                        '${_.agreementFormModel?.jamKerjaMulai} - ${_.agreementFormModel?.jamKerjaBerakhir}'),
                                const SizedBox(height: 20),
                                AppSeeList(name: 'Gaji', value: _.agreementFormModel?.gaji ?? ''),
                                const SizedBox(height: 20),
                                if (_.statusPengajuan() == 'Ditolak') ...[
                                  AppSeeList(name: 'Alasan', value: _.agreementFormModel?.alasan ?? '-'),
                                  const SizedBox(height: 20),
                                ],
                                AppSeeList(name: 'Status Pengajuan', value: _.statusPengajuan()),
                                if (_.user?.role == SATPAM && _.statusPengajuan() == 'Belum Dijawab') ...[
                                  const Spacer(),
                                  Row(
                                    children: [
                                      AppButton(
                                        text: 'Tidak Setuju',
                                        onPressed: (() {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Alasan',
                                                  style: AppTextStyle.textMedium.copyWith(fontSize: 24),
                                                ),
                                                content: ListView(
                                                  shrinkWrap: true,
                                                  children: [
                                                    AppTextFormField(
                                                      controller: _.alasanTEC!,
                                                      hintText: 'Masukkan Alasan',
                                                      validator: FormValidator.commonString,
                                                      paddingBottom: AppSize.small,
                                                      paddingTop: AppSize.micro / 2,
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context),
                                                    child: Text('Batal', style: AppTextStyle.textBold),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  TextButton(
                                                    child: Text('Kirim', style: AppTextStyle.textBlack),
                                                    onPressed: () async {
                                                      if (_.alasanTEC!.text.isNotEmpty) {
                                                        await _.confirmationAgreementForm(false).then((value) {
                                                          Navigator.pop(context);
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                      AppButton(
                                        text: 'Setuju',
                                        onPressed: (() {
                                          AppConfirmationDialog.show(
                                            Get.context!,
                                            message: 'Apakah anda yakin untuk melakukan kesepakatan?',
                                            textAgree: 'Ya',
                                          ).then((value) async {
                                            if (!value) return;
                                            await _.confirmationAgreementForm(true);
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSize.medium),
                                ]
                              ],
                            ),
                          )
                        : Center(
                            child: Text(
                              'Belum ada kontrak kerja',
                              style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
