import 'package:get/get.dart';

import 'package:hallopak/app/modules/cari_satpam/controllers/detail_satpam_controller.dart';

import '../controllers/cari_satpam_controller.dart';

class CariSatpamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSatpamController>(
      () => DetailSatpamController(),
    );
    Get.lazyPut<CariSatpamController>(
      () => CariSatpamController(),
    );
  }
}
