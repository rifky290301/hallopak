import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_shadow.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
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
              AppHeader.appText('Chats'),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.small),
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: AppSize.semiSmall),
                        padding: const EdgeInsets.all(AppSize.small),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.semiSmall),
                          color: Colors.white,
                          boxShadow: [AppShadow.appShadowList],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.semiSmall),
                              child: Image.asset(
                                'assets/images/image/photo_profile.png',
                                height: 60,
                                width: 60,
                              ),
                            ),
                            const SizedBox(width: AppSize.semiSmall),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Nama Pengirim',
                                        style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Spacer(),
                                      Text(
                                        '10:00 AM',
                                        style: AppTextStyle.textRegular.copyWith(
                                          fontSize: 14,
                                          color: AppColors.textDisable,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSize.micro),
                                  Text(
                                    'Lorem ipsum dolor',
                                    style:
                                        AppTextStyle.textRegular.copyWith(fontSize: 14, color: AppColors.textDisable),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
