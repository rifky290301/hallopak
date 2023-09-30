import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/ulasan_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/chat_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/routes/app_pages.dart';

class DetailSatpamController extends GetxController {
  final chatProvider = ChatProvider();
  UserModel? user;
  ProfileModel? profile;
  UlasanModel? ulasan;

  Future<void> connectChat() async {
    final chat = ChatModel(
      warga: Get.find<LocalStorage>().user.email ?? '',
      satpam: user?.email ?? '',
      lastMessage: null,
      lastMessageTime: null,
      isAcc: false,
      bintang: 0,
      ulasan: null,
    );
    await chatProvider.addChat(chat);
    Get.back();
    Get.offNamed(Routes.CHAT);
  }

  @override
  void onInit() {
    super.onInit();
    profile = Get.arguments[0] as ProfileModel;
    user = Get.arguments[1] as UserModel;
    ulasan = Get.arguments[2] as UlasanModel;
    update(['detail']);
  }
}
