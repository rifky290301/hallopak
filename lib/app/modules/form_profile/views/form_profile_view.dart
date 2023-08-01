import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_date_field.dart';
import 'package:hallopak/app/themes/widgets/app_dropdown_form_field.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/form_profile_controller.dart';

class FormProfileView extends GetView<FormProfileController> {
  const FormProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image/bg_login2.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              Image.asset(
                'assets/images/logo/logo_hallopak.png',
                width: 200,
              ),
              Form(
                key: controller.globarKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lengkapi Profil Anda',
                      style: AppTextStyle.textMedium.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(height: AppSize.semiLarge),
                    Text('Nama', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: controller.namaTEC!,
                      hintText: 'Nama',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                    ),
                    Text('NIK', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: controller.nikTEC!,
                      hintText: 'NIK',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                    ),
                    Text('No HP', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: controller.noHpTEC!,
                      hintText: 'No HP',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                      keyboardType: TextInputType.number,
                    ),
                    Text('Alamat', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: controller.alamatTEC!,
                      hintText: 'Alamat',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                    ),
                    Text('Pendidikan Terakhir', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: controller.pendidikanTerakhirTEC!,
                      hintText: 'Pendidikan Terakhir',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                    ),
                    Text('Status', style: AppTextStyle.textMedium),
                    AppDropdownFormField(
                      validator: FormValidator.commonString,
                      listItem: const [MENIKAH, BELUM_MENIKAH],
                      selectedValue: controller.status,
                      hintText: 'Pilih Status',
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                      onChanged: (String? newValue) {
                        controller.status = newValue!;
                      },
                    ),
                    Text('Tempat Lahir', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: controller.tempatLahirTEC!,
                      hintText: 'Tempat Lahir',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                    ),
                    Text('Tanggal Lahir', style: AppTextStyle.textMedium),
                    AppDateField(
                      controller: controller.tanggalLahirTEC!,
                      hintText: 'Tanggal Lahir',
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                      onSelectedDate: (DateTime? date) {
                        controller.tanggalLahirTEC!.text = '${date!.day} - ${date.month} - ${date.year}';
                        controller.tanggalLahir = Timestamp.fromDate(date);
                      },
                    ),
                    if (controller.local.user.role == SATPAM) ...[
                      Text('Sertifikat', style: AppTextStyle.textMedium),
                      InkWell(
                        onTap: () => controller.pickImageSource(ImageSource.gallery),
                        child: GetBuilder<FormProfileController>(
                          id: 'image',
                          init: controller,
                          builder: (_) {
                            return Container(
                              height: Get.width,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(AppSize.semiSmall),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.25),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: _.sertifikat == null
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.photo_camera_outlined,
                                          color: AppColors.textDisable,
                                          size: AppSize.semiLarge,
                                        ),
                                        const SizedBox(height: AppSize.micro / 2),
                                        Text(
                                          'Ambil Foto',
                                          style: AppTextStyle.textBold,
                                        ),
                                      ],
                                    )
                                  : Image.file(_.sertifikat!),
                            );
                          },
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSize.largest),
                    SizedBox(
                      width: Get.width,
                      child: Center(
                        child: AppButton(
                          text: 'Kirim',
                          onPressed: () {
                            if (controller.globarKey.currentState!.validate()) {
                              controller.createProfile();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                child: Text(
                  'Lewati',
                  style: AppTextStyle.textMedium.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
