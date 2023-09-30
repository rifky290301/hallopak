import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/complaint_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';
import 'package:hallopak/app/data/providers/chat_provider.dart';
import 'package:hallopak/app/data/providers/complaint_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';
import 'package:hallopak/app/themes/dialog/app_confirmation_dialog.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

import '../../controllers/complaint_controller.dart';

class AddComplaintController extends GetxController {
  final _local = Get.find<LocalStorage>().user;
  final authProvider = Get.find<AuthProvider>();
  final complaintController = Get.find<ComplaintController>();
  final globarKey = GlobalKey<FormState>();
  final chatProvider = ChatProvider();
  final complaintProvider = ComplaintProvider();
  final profileProvider = ProfileProvider();
  TextEditingController? judulTEC, deskripsiTEC;
  List<ProfileModel> profiles = [];
  String? selectedEmail;
  String? selectedSatpam;
  Timestamp? tanggal;

  Future<void> getChats() async {
    List<ChatModel> chats = await chatProvider.getChats(role: _local.role!, email: _local.email!, isAcc: true);
    if (chats.isEmpty) {
      infoSnackbar("Tidak ada satpam yang tersedia");
    } else {
      for (var chat in chats) {
        final profile = await profileProvider.getProfile(chat.satpam!);
        profiles.add(profile);
      }
    }
    update();
  }

  Future<void> addComplaint() async {
    AppConfirmationDialog.show(
      Get.context!,
      message: 'Apakah anda yakin untuk melaporkan ?',
      textAgree: 'Ya',
    ).then((value) async {
      if (!value) return;
      AppLoadingDialog.show(Get.context!);
      final model = ComplaintModel(
        satpam: selectedEmail,
        warga: _local.email!,
        judul: judulTEC!.text,
        deskripsi: deskripsiTEC!.text,
        waktu: Timestamp.now(),
      );
      await complaintProvider.addComplaint(model).then((value) {
        complaintController.addComplaint(model);
        clear();
        Get.back();
        successSnackbar("Berhasil mengirimkan komplain");
      });
    });
  }

  void clear() {
    judulTEC!.clear();
    deskripsiTEC!.clear();
    selectedEmail = null;
    selectedSatpam = null;
  }

  @override
  void onInit() {
    judulTEC = TextEditingController();
    deskripsiTEC = TextEditingController();
    getChats();
    super.onInit();
  }
}
