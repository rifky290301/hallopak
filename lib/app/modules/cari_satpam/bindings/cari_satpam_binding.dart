import 'package:get/get.dart';

import '../controllers/cari_satpam_controller.dart';

class CariSatpamBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DetailSatpamController>(
    //   () => DetailSatpamController(),
    // );
    Get.lazyPut<CariSatpamController>(
      () => CariSatpamController(),
    );
  }
}
