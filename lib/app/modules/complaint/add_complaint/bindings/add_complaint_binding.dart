import 'package:get/get.dart';

import '../controllers/add_complaint_controller.dart';

class AddComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddComplaintController>(
      () => AddComplaintController(),
    );
  }
}
