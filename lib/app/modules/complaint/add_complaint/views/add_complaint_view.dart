import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_dropdown_form_field.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';

import '../controllers/add_complaint_controller.dart';

class AddComplaintView extends GetView<AddComplaintController> {
  const AddComplaintView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: AppDecoration.appHeader,
      child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppHeader.appBack,
        AppHeader.appText('Komplain'),
        Form(
          key: controller.globarKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
            child: GetBuilder<AddComplaintController>(
              init: controller,
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Judul', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: _.judulTEC!,
                      hintText: 'Judul',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                    ),
                    Text('Deskripsi', style: AppTextStyle.textMedium),
                    AppTextFormField(
                      controller: _.deskripsiTEC!,
                      hintText: 'Deskripsi',
                      validator: FormValidator.commonString,
                      paddingBottom: AppSize.small,
                      paddingTop: AppSize.micro / 2,
                    ),
                    Text('Satpam', style: AppTextStyle.textMedium),
                    const SizedBox(height: AppSize.micro / 2),
                    AppDropdownFormField(
                      validator: FormValidator.commonString,
                      listItem: _.profiles.map((e) => e.nama!).toList(),
                      selectedValue: _.selectedSatpam,
                      onChanged: (String? val) {
                        _.selectedEmail = _.profiles.firstWhere((element) => element.nama == val).id!;
                      },
                      hintText: 'Pilih Satpam',
                    ),
                    const SizedBox(height: AppSize.largest),
                    SizedBox(
                      width: Get.width,
                      child: Center(
                        child: AppButton(
                          text: 'Laporkan',
                          onPressed: () {
                            if (_.globarKey.currentState!.validate()) {
                              controller.addComplaint();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const Center(child: Text('')),
      ])),
    ));
  }
}
