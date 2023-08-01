import 'dart:async';

import 'package:get/get.dart';

import '../../../data/providers/auth_provider.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  void handleAuthStateChanged() async {
    authProvider.authStateChanges.listen((user) {
      if (user == null) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    });
  }

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () => handleAuthStateChanged(),
      // () => Get.toNamed(Routes.FORM_PROFILE),
    );
    super.onInit();
  }
}
