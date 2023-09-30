import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/agreement_form_model.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/agreement_form_provider.dart';
import 'package:hallopak/app/data/providers/chat_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

class SeeFormController extends GetxController {
  final _agreementFormProvider = AgreementFormProvider();
  final chatProvider = ChatProvider();
  final globarKey = GlobalKey<FormState>();
  final _local = Get.find<LocalStorage>();
  AgreementFormModel? agreementFormModel;
  TextEditingController? alasanTEC;
  ChatModel? chatModel;
  UserModel? get user => _local.user;

  Future<void> confirmationAgreementForm(bool isAcc) async {
    AppLoadingDialog.show(Get.context!);
    AgreementFormModel model = agreementFormModel!.copyWith(isAcc: isAcc, alasan: alasanTEC?.text);
    await _agreementFormProvider.updateAgreementForm(chatModel!.id!, agreementFormModel!.id!, model);
    await updateChat();
    successSnackbar("Berhasil mengirimkan konfirmasi");
    agreementFormModel = agreementFormModel!.copyWith(isAcc: isAcc, alasan: alasanTEC!.text);
    AppLoadingDialog.close(Get.context!);
    update();
  }

  Future<void> updateChat() async {
    chatModel = chatModel!.copyWith(isAcc: true);
    await chatProvider.updateChat(chatModel!);
  }

  Future<void> getAgreementForm() async {
    agreementFormModel = await _agreementFormProvider.getAgreementForm(chatModel!.id!);
    update();
  }

  String statusPengajuan() {
    if ((agreementFormModel!.alasan == null || agreementFormModel!.alasan == '') &&
        (agreementFormModel!.isAcc! == false)) {
      return 'Belum Dijawab';
    } else if (agreementFormModel!.isAcc!) {
      return 'Disetujui';
    }
    return 'Ditolak';
  }

  @override
  void onInit() {
    alasanTEC = TextEditingController();
    chatModel = Get.arguments as ChatModel;
    getAgreementForm();
    super.onInit();
  }
}
