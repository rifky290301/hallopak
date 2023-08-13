import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/modules/cari_satpam/controllers/detail_satpam_controller.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';

class DetailSatpamView extends GetView<DetailSatpamController> {
  DetailSatpamView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(DetailSatpamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.appHeader,
        child: SafeArea(
          child: GetBuilder<DetailSatpamController>(
            id: 'detail',
            init: controller,
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader.appBack,
                  AppHeader.appText('Detail Satpam'),
                  Padding(
                    padding: const EdgeInsets.only(left: AppSize.medium, right: AppSize.medium, bottom: AppSize.medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: _.profile?.profile ?? '',
                          height: 200,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(color: AppColors.primary),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                        const SizedBox(height: AppSize.medium),
                        Text(_.profile?.nama ?? '', style: AppTextStyle.textMedium.copyWith(fontSize: 24)),
                        const SizedBox(height: AppSize.medium),
                        Text(_.profile?.alamat ?? '', style: AppTextStyle.textMedium.copyWith(fontSize: 16)),
                        const SizedBox(height: AppSize.medium),
                        AppButton(text: 'Chat Satpam', onPressed: () => _.connectChat()),
                      ],
                    ),
                  ),

                  // const Spacer(),
                  const Center(child: Text('')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
