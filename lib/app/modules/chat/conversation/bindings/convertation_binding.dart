import 'package:get/get.dart';

import '../controllers/conversation_controller.dart';

class ConvertationBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AgreementFormController>(
    //   () => AgreementFormController(),
    // );
    Get.lazyPut<ConversationController>(
      () => ConversationController(),
    );
  }
}
