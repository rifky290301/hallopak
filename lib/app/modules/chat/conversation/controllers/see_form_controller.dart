import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/agreement_form_model.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/providers/agreement_form_provider.dart';
import 'package:hallopak/app/data/providers/chat_provider.dart';

import '../../../../routes/app_pages.dart';

class SeeFormController extends GetxController {
  final _agreementFormProvider = AgreementFormProvider();
  final chatProvider = ChatProvider();
  final globarKey = GlobalKey<FormState>();
  AgreementFormModel agreementFormModel = AgreementFormModel();
  TextEditingController? alasanTEC;
  ChatModel? chatModel;

  Future<void> addAgreementForm() async {
    AgreementFormModel? model;
    model = await _agreementFormProvider.getAgreementForm(chatModel!.id!)
      ..copyWith(isAcc: true);
    await _agreementFormProvider.addAgreementForm(chatModel!.id!, model);
    await updateChat();
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> updateChat() async {
    chatModel = chatModel!.copyWith(isAcc: true);
    await chatProvider.updateChat(chatModel!);
  }

  Future<void> getAgreementForm() async {
    agreementFormModel = await _agreementFormProvider.getAgreementForm(chatModel!.id!);
  }

  @override
  void onInit() {
    alasanTEC = TextEditingController();
    chatModel = Get.arguments as ChatModel;
    getAgreementForm();
    super.onInit();
  }
}
