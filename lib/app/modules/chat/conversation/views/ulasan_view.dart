import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';

import '../controllers/ulasan_controller.dart';

class UlasanView extends GetView {
  UlasanView({Key? key}) : super(key: key);
  @override
  final ctrl = Get.put(UlasanController());

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
              AppHeader.appText('Ulasan'),
              Form(
                key: ctrl.globarKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                  child: GetBuilder<UlasanController>(
                    init: ctrl,
                    initState: (state) => ctrl.init(),
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Saran/Kritikan', style: AppTextStyle.textMedium),
                          AppTextFormField(
                            controller: _.ulasanTEC!,
                            hintText: 'Saran/Kritikan',
                            readOnly: _.chatModel?.ulasan == null ? false : true,
                            paddingBottom: AppSize.small,
                            validator: FormValidator.commonString,
                            paddingTop: AppSize.micro / 2,
                          ),
                          RatingBar.builder(
                            initialRating: double.parse(_.bintangTEC!.text),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            ignoreGestures: _.chatModel?.ulasan == null ? false : true,
                            itemSize: 32,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            onRatingUpdate: (rating) {
                              _.bintangTEC?.text = rating.toString();
                              _.update();
                            },
                          ),
                          const SizedBox(height: AppSize.largest),
                          if (_.chatModel?.ulasan == null)
                            SizedBox(
                              width: Get.width,
                              child: Center(
                                child: AppButton(
                                  text: 'Kirim',
                                  onPressed: () {
                                    if (_.globarKey.currentState!.validate()) {
                                      _.updateChat();
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
              const Center(child: Text(' ')),
            ],
          ),
        ),
      ),
    );
  }
}
