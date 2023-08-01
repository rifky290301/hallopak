import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';
import 'package:hallopak/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  List<Icon> iconList = [
    const Icon(CupertinoIcons.home, size: 30),
    const Icon(CupertinoIcons.person, size: 30),
    const Icon(CupertinoIcons.settings, size: 30),
  ];
  List<String> titleList = ['Pengaduan', 'Chat', 'Cari Satpam'];
  String? role;

  void logout() async {
    try {
      await authProvider.signOut();
      Get.snackbar(
        'Success',
        'Logout Success',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onInit() {
    role = Get.arguments;
    super.onInit();
  }
}
