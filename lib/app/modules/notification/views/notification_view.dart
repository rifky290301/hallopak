import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_shadow.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
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
              AppHeader.appText('Notifikasi'),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.small),
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 105,
                      margin: const EdgeInsets.only(bottom: AppSize.semiSmall),
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.medium, vertical: AppSize.semiSmall),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.semiSmall),
                        color: Colors.white,
                        boxShadow: [AppShadow.appShadowList],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.notifications_active_rounded,
                            color: Color(0xFFDA6317),
                            size: 45,
                          ),
                          const SizedBox(width: AppSize.semiSmall),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Get.width - 150,
                                child: Text(
                                  'Pengiriman sedang diproses Pengiriman sedang diproses',
                                  style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: AppSize.micro),
                              Text(
                                '24 Juni 2021 10:00 AM',
                                style: AppTextStyle.textRegular.copyWith(fontSize: 14, color: AppColors.textDisable),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Center(
                child: Text(
                  ' ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
