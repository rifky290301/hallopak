import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/core/static/storage_var.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';
import 'package:hallopak/app/data/providers/upload_file_provider.dart';
import 'package:hallopak/app/themes/dialog/app_bottom_sheet.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';
import 'package:image_picker/image_picker.dart';

enum FilePick { sertifikat, profile }

class EditProfileController extends GetxController {
  final _imagePicker = ImagePicker();
  final _local = Get.find<LocalStorage>();
  final globarKey = GlobalKey<FormState>();
  TextEditingController? namaTEC;
  TextEditingController? nikTEC;
  TextEditingController? noHpTEC;
  TextEditingController? alamatTEC;
  TextEditingController? pendidikanTerakhirTEC;
  TextEditingController? tempatLahirTEC;
  TextEditingController? tanggalLahirTEC;
  Timestamp? tanggalLahir;
  File? sertifikatFile;
  File? profileFile;
  String? status;

  String? urlSertifikat;
  String? urlProfile;

  LocalStorage get local => _local;

  Future<void> pickImageSource(FilePick filePick) async {
    try {
      // ImageSource pick = await AppBottomSheet.buildBottomSheet(Get.context!);
      ImageSource? source = await buildBottomSheetCustom(Get.context!);
      if (source == null) return;
      final image = await _imagePicker.pickImage(source: source);
      if (image == null) return;
      switch (filePick) {
        case FilePick.sertifikat:
          sertifikatFile = File(image.path);
          break;
        case FilePick.profile:
          profileFile = File(image.path);
          break;
        default:
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    update(['image']);
  }

  Future<void> createProfile() async {
    if (local.user.role == SATPAM) {
      if (urlSertifikat == null || urlProfile == null) {
        if (sertifikatFile == null || profileFile == null) {
          update(['required']);
          return;
        }
      }
    } else {
      if (urlProfile == null) {
        if (profileFile == null) {
          update(['required']);
          return;
        }
      }
    }
    AppLoadingDialog.show(Get.context!);
    if (sertifikatFile != null) {
      urlSertifikat = await UploadFileProvide().uploadFile(sertifikatFile!, StorageVar.sertifikat);
    }
    if (profileFile != null) urlProfile = await UploadFileProvide().uploadFile(profileFile!, StorageVar.profile);

    final profile = ProfileModel(
      nama: namaTEC!.text,
      nik: nikTEC!.text,
      noHp: noHpTEC!.text,
      alamat: alamatTEC!.text,
      pendidikanTerakhir: pendidikanTerakhirTEC!.text,
      status: status,
      tempatLahir: tempatLahirTEC!.text,
      tanggalLahir: tanggalLahir,
      sertifikat: urlSertifikat,
      profile: urlProfile,
    );
    await ProfileProvider().updateProfile(profile, _local.user.email!);
    AppLoadingDialog.close(Get.context!);
    Get.snackbar(
      'Success',
      'Profil berhasil diubah',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onInit() {
    var profile = Get.arguments as ProfileModel;
    namaTEC = TextEditingController(text: profile.nama);
    nikTEC = TextEditingController(text: profile.nik);
    noHpTEC = TextEditingController(text: profile.noHp);
    alamatTEC = TextEditingController(text: profile.alamat);
    pendidikanTerakhirTEC = TextEditingController(text: profile.pendidikanTerakhir);
    tempatLahirTEC = TextEditingController(text: profile.tempatLahir);
    tanggalLahirTEC = TextEditingController(text: ConvertTime.convertDate(profile.tanggalLahir!));
    tanggalLahir = profile.tanggalLahir;
    status = profile.status;
    urlProfile = profile.profile;
    urlSertifikat = profile.sertifikat;
    // update(['image']);
    super.onInit();
  }
}
