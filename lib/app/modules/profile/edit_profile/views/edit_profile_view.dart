import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_date_field.dart';
import 'package:hallopak/app/themes/widgets/app_dropdown_form_field.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_loading_image.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          // padding: const EdgeInsets.all(20),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/image/bg_login2.png'),
          //     fit: BoxFit.fitWidth,
          //     alignment: Alignment.topCenter,
          //   ),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader.appBack,
              AppHeader.appText('Edit Profil'),
              Form(
                key: controller.globarKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: AppSize.semiLarge),
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
                        // paddingBottom: AppSize.small,
                        validator: FormValidator.commonString,
                        paddingTop: AppSize.micro / 2,
                        onSelectedDate: (DateTime? date) {
                          controller.tanggalLahirTEC!.text = '${date!.day} - ${date.month} - ${date.year}';
                          controller.tanggalLahir = Timestamp.fromDate(date);
                        },
                      ),
                      const SizedBox(height: AppSize.small),
                      Text('Foto Profil', style: AppTextStyle.textMedium),
                      InkWell(
                        onTap: () => controller.pickImageSource(FilePick.profile),
                        child: GetBuilder<EditProfileController>(
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
                              child: _.urlProfile != null && _.profileFile == null
                                  ? Image.network(_.urlProfile!, loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return appLoadingImage(loadingProgress);
                                    })
                                  : _.profileFile == null
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
                                      : Image.file(_.profileFile!),
                            );
                          },
                        ),
                      ),
                      GetBuilder<EditProfileController>(
                        id: 'required',
                        builder: (_) {
                          if (_.urlProfile != null) return const SizedBox();
                          return _.profileFile != null
                              ? Text(
                                  'Tidak boleh kosong',
                                  style: AppTextStyle.textRegular.copyWith(color: AppColors.danger),
                                )
                              : const SizedBox();
                        },
                      ),
                      if (controller.local.user.role == SATPAM) ...[
                        const SizedBox(height: AppSize.small),
                        Text('Sertifikat', style: AppTextStyle.textMedium),
                        InkWell(
                          onTap: () => controller.pickImageSource(FilePick.sertifikat),
                          child: GetBuilder<EditProfileController>(
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
                                child: _.urlSertifikat != null && _.sertifikatFile == null
                                    ? Image.network(_.urlSertifikat!,
                                        loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.primary,
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                    loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      })
                                    : _.sertifikatFile == null
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
                                        : Image.file(_.sertifikatFile!),
                              );
                            },
                          ),
                        ),
                        GetBuilder<EditProfileController>(
                          id: 'required',
                          builder: (_) {
                            if (_.urlSertifikat != null) return const SizedBox();
                            return _.sertifikatFile != null
                                ? Text(
                                    'Tidak boleh kosong',
                                    style: AppTextStyle.textRegular.copyWith(color: AppColors.danger),
                                  )
                                : const SizedBox();
                          },
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
                      const SizedBox(height: AppSize.medium),
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
