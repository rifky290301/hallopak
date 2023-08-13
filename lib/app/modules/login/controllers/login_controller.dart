import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/user_provider.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/dialog/app_loading_dialog.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

class LoginController extends GetxController {
  final _local = Get.find<LocalStorage>();
  final authProvider = Get.find<AuthProvider>();
  TextEditingController? emailTEC;
  TextEditingController? passwordTEC;
  bool isPassword = true;

  void login() async {
    AppLoadingDialog.show(Get.context!);
    try {
      await authProvider.signIn(emailTEC!.text, passwordTEC!.text);
      UserModel user = await UserProvider().getUser(emailTEC!.text);
      Get.snackbar(
        'Success',
        'Login Success',
        snackPosition: SnackPosition.BOTTOM,
      );
      _local.storeUser = user;
      Get.offAllNamed(Routes.HOME);
      // Get.offAllNamed(Routes.FORM_PROFILE);
    } catch (e) {
      errorSnackbar(e.toString());
      AppLoadingDialog.close(Get.context!);
    }
  }

  @override
  void onInit() {
    emailTEC = TextEditingController();
    passwordTEC = TextEditingController();
    super.onInit();
  }
}
