import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/agreement_form_model.dart';
import 'package:hallopak/app/data/providers/agreement_form_provider.dart';
import 'package:hallopak/app/modules/chat/conversation/controllers/conversation_controller.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

import '../../../../themes/dialog/app_confirmation_dialog.dart';

class AgreementFormController extends GetxController {
  final _chatting = Get.find<ConversationController>();
  final _agreementFormProvider = AgreementFormProvider();
  final globarKey = GlobalKey<FormState>();
  TextEditingController? wargaTEC;
  TextEditingController? satpamTEC;
  TextEditingController? alamatTEC;
  TextEditingController? jamKerjaTEC;
  TextEditingController? jamKerjaMulaiTEC;
  TextEditingController? jamKerjaBerakhirTEC;
  TextEditingController? alasanTEC;
  TextEditingController? gajiTEC;
  TextEditingController? tanggalKontrakMulaiTEC;
  TextEditingController? tanggalKontrakSelesaiTEC;
  Timestamp? tanggalKontrakMulai;
  Timestamp? tanggalKontrakSelesai;
  AgreementFormModel? agreementFormModel;
  // ChatModel? chatModel;
  bool? isAcc;

  Future<void> addForm() async {
    AppConfirmationDialog.show(
      Get.context!,
      message: 'Apakah anda yakin untuk melakukan kesepakatan?',
      textAgree: 'Ya',
    ).then((value) async {
      if (!value) return;
      try {
        AppLoadingDialog.show(Get.context!);
        final data = AgreementFormModel(
          warga: wargaTEC!.text,
          satpam: satpamTEC!.text,
          alamatPenempatan: alamatTEC!.text,
          tanggalKontrakMulai: tanggalKontrakMulai,
          tanggalKontrakSelesai: tanggalKontrakSelesai,
          // jamKerja: jamKerjaTEC!.text,
          jamKerjaMulai: jamKerjaMulaiTEC?.text,
          jamKerjaBerakhir: jamKerjaBerakhirTEC?.text,
          gaji: gajiTEC!.text,
          isAcc: false,
          alasan: null,
        );

        await _agreementFormProvider.addAgreementForm(_chatting.chatModel!.id!, data).then((value) {
          Get.back();
          Get.back();
          Get.back();
          successSnackbar("Berhasil mengirimkan form");
        });
        // successSnackbar("Berhasil mengirimkan form");
        Get.back();
      } catch (e) {
        AppLoadingDialog.close(Get.context!);
        errorSnackbar(e.toString());
      }
    });
  }

  @override
  void onInit() {
    wargaTEC = TextEditingController();
    satpamTEC = TextEditingController();
    alamatTEC = TextEditingController();
    jamKerjaBerakhirTEC = TextEditingController();
    jamKerjaMulaiTEC = TextEditingController();
    // alasanTEC = TextEditingController();
    gajiTEC = TextEditingController();
    tanggalKontrakMulaiTEC = TextEditingController();
    tanggalKontrakSelesaiTEC = TextEditingController();
    super.onInit();
  }
}
