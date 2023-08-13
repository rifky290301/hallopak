import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_shadow.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_skeletons.dart';

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
                child: GetBuilder<ChatController>(
                  id: 'chat',
                  builder: (_) {
                    if (_.isLoad) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.small),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CustomSkeleton.skeletonListTile(context);
                        },
                      );
                    } else if (_.listChat.isEmpty) {
                      return Center(
                        child: Text(
                          'Tidak ada chat',
                          style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.small),
                      itemCount: _.listProfile.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        ProfileModel profile = _.listProfile[index];
                        Timestamp? time = _.listChat[index].lastMessageTime;
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.CONVERTATION, arguments: [_.listChat[index], profile]);
                          },
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
                                  child: CachedNetworkImage(
                                    imageUrl: profile.profile ?? '',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(color: AppColors.primary),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                            profile.nama ?? '',
                                            style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const Spacer(),
                                          Text(
                                            time != null ? ConvertTime.convertTime(time) : '',
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
                                        _.listChat[index].lastMessage ?? '',
                                        style: AppTextStyle.textRegular.copyWith(
                                          fontSize: 14,
                                          color: AppColors.textDisable,
                                        ),
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
                    );
                  },
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
