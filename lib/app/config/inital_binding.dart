import 'package:get/get.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthProvider>(AuthProvider(), permanent: true);
  }
}
