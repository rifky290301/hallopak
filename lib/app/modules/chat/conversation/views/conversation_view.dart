import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/conversation_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

import '../controllers/conversation_controller.dart';
import 'agreement_form_view.dart';
import 'see_form_view.dart';

class ConvertationView extends GetView<ConversationController> {
  const ConvertationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          controller.profileModel!.nama ?? '',
          style: AppTextStyle.textBold.copyWith(color: Colors.white, fontSize: 20),
        ),
        actions: [
          GetBuilder<ConversationController>(
            id: 'agreement_form',
            builder: (_) {
              return IconButton(
                onPressed: () {
                  if (_.user.role == SATPAM) {
                    Get.to(() => SeeFormView(), arguments: _.chatModel);
                  } else {
                    Get.to(() => AgreementFormView());
                    // if (!controller.chatModel!.isAcc!) {
                    //   Get.to(() => AgreementFormView());
                    // } else {
                    //   infoSnackbar('Form sudah diisi');
                    // }
                  }
                },
                icon: Icon(_.user.role == SATPAM ? Icons.remove_red_eye : Icons.more_vert),
              );
            },
          ),
        ],
      ),*/

      body: Container(
        decoration: AppDecoration.appHeader,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.medium),
            Row(
              children: [
                AppHeader.appBack,
                const Spacer(),
                GetBuilder<ConversationController>(
                  init: controller,
                  builder: (_) {
                    return Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(right: AppSize.medium),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.small),
                        color: const Color(0xFFFDF5ED),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (_.user.role == SATPAM) {
                            Get.to(() => SeeFormView(), arguments: _.chatModel);
                          } else {
                            // Get.to(() => AgreementFormView());
                            if (!controller.chatModel!.isAcc!) {
                              Get.to(() => AgreementFormView());
                            } else {
                              infoSnackbar('Form sudah diisi');
                            }
                          }
                        },
                        icon: Icon(
                          _.user.role == SATPAM ? Icons.remove_red_eye : Icons.more_vert,
                          color: const Color(0xFFDA6317),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            AppHeader.appText('Chats'),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<ConversationModel>>(
                      stream: controller.getConversationsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) const Text('Something went wrong');
                        if (!snapshot.hasData) const Center(child: CircularProgressIndicator());
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            ConversationModel data = snapshot.data![index];
                            return BubbleNormal(
                              text: data.pesan ?? '',
                              isSender: data.pengirim == controller.user.email,
                              color: AppColors.primary,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 72,
                    padding: const EdgeInsets.all(AppSize.small),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.pesanTEC,
                            decoration: InputDecoration(
                              hintStyle: AppTextStyle.textRegular,
                              hintText: 'Type a message',
                              focusColor: AppColors.primary,
                              fillColor: AppColors.secondary,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSize.medium),
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(120),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.send, color: Colors.white),
                            onPressed: () => controller.addConversation(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
