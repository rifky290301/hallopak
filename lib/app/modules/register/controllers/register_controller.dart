import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/user_provider.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final _local = Get.find<LocalStorage>();
  TextEditingController? emailTEC;
  TextEditingController? passwordTEC;
  String? selectedRole;
  bool isPassword = true;

  void register() async {
    AppLoadingDialog.show(Get.context!);
    try {
      var user = UserModel(
        email: emailTEC!.text,
        role: selectedRole,
      );
      await authProvider.signUp(user.email!, passwordTEC!.text);
      UserProvider().createUser(user.email!, selectedRole!);
      Get.snackbar(
        'Success',
        'Register Success',
        snackPosition: SnackPosition.BOTTOM,
      );
      _local.storeUser(user);
      Get.offAllNamed(Routes.FORM_PROFILE);
    } catch (e) {
      errorSnackbar(e.toString());
      // AppLoadingDialog.close(Get.context!);
    }
  }

  @override
  void onInit() {
    emailTEC = TextEditingController();
    passwordTEC = TextEditingController();
    super.onInit();
  }
}
