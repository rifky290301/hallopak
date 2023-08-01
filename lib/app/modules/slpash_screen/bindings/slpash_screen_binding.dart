import 'package:get/get.dart';

import '../controllers/slpash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashScreenController>(
    //   () => SplashScreenController(),
    // );
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
