import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/core/static/storage_var.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';
import 'package:hallopak/app/data/providers/upload_file_provider.dart';
import 'package:hallopak/app/themes/dialog/app_confirmation_dialog.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final _local = Get.find<LocalStorage>();
  final _imagePicker = ImagePicker();
  final _profileProvider = ProfileProvider();
  ProfileModel? profile;
  File? profileFile;

  Future<void> getProfile() async {
    profile = await _profileProvider.getProfile(_local.user.email!);
    update(['image', 'name']);
  }

  Future<void> pickImageSource(ImageSource pick) async {
    String? urlProfile;
    try {
      final image = await _imagePicker.pickImage(source: pick);
      if (image == null) return;
      AppLoadingDialog.show(Get.context!);
      profileFile = File(image.path);
      urlProfile = await UploadFileProvide().uploadFile(profileFile!, StorageVar.profile);
      profile = profile!.copyWith(profile: urlProfile);
      _profileProvider.updateProfile(profile!, _local.user.email!);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    } finally {
      AppLoadingDialog.close(Get.context!);
    }
    update(['image']);
  }

  void logout() async {
    AppConfirmationDialog.show(
      Get.context!,
      message: 'Apakah anda yakin ingin keluar?',
    ).then((value) async {
      if (!value) return;
      _local.box.erase();
      await authProvider.signOut();
    });
  }

  @override
  void onInit() async {
    await getProfile();
    super.onInit();
  }
}
