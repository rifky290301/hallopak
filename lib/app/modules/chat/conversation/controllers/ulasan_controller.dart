import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/providers/chat_provider.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

class UlasanController extends GetxController {
  final globarKey = GlobalKey<FormState>();
  final chatProvider = ChatProvider();
  TextEditingController? ulasanTEC, bintangTEC;
  ChatModel? chatModel;

  Future<void> updateChat() async {
    AppLoadingDialog.show(Get.context!);
    try {
      chatModel = chatModel!.copyWith(
        bintang: calcRanks(double.parse(bintangTEC!.text)),
        ulasan: ulasanTEC!.text,
      );
      inspect(chatModel);
      await chatProvider.updateChat(chatModel!);
      successSnackbar("Berhasil mengirimkan form");
    } catch (e) {
      // AppLoadingDialog.close(Get.context!);
      errorSnackbar(e.toString());
    }
    AppLoadingDialog.close(Get.context!);
    // Get.back();
  }

  int calcRanks(ranks) {
    double multiplier = .5;
    return (multiplier * ranks).round();
  }

  void init() async {
    chatModel = await Get.arguments as ChatModel;
    ulasanTEC = TextEditingController(text: chatModel?.ulasan);
    bintangTEC = TextEditingController(text: chatModel?.bintang.toString() ?? '0');
    update();
  }

  // @override
  // void onInit() async {
  //   chatModel = await Get.arguments as ChatModel;
  //   ulasanTEC = TextEditingController();
  //   bintangTEC = TextEditingController(text: chatModel?.bintang.toString() ?? '0');
  //   update();
  //   super.onInit();
  // }
}
