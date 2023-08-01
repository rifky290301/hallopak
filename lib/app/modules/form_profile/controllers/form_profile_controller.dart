import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';
import 'package:hallopak/app/data/providers/upload_file_provider.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:image_picker/image_picker.dart';

class FormProfileController extends GetxController {
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
  File? sertifikat;
  String? status;
  String? selectedRole;

  LocalStorage get local => _local;

  Future<void> pickImageSource(ImageSource pick) async {
    try {
      final image = await _imagePicker.pickImage(source: pick);
      if (image == null) return;
      sertifikat = File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    update(['image']);
  }

  Future<void> createProfile() async {
    AppLoadingDialog.show(Get.context!);
    String? urlSertifikat;
    if (sertifikat != null) urlSertifikat = await UploadFileProvide().uploadFile(sertifikat!);
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
    );
    await ProfileProvider().updateProfile(profile, _local.user.email!);
    Get.snackbar(
      'Success',
      'Profile Created',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offNamed(Routes.HOME);
  }

  @override
  void onInit() {
    namaTEC = TextEditingController();
    nikTEC = TextEditingController();
    noHpTEC = TextEditingController();
    alamatTEC = TextEditingController();
    pendidikanTerakhirTEC = TextEditingController();
    tempatLahirTEC = TextEditingController();
    tanggalLahirTEC = TextEditingController();
    super.onInit();
  }
}
