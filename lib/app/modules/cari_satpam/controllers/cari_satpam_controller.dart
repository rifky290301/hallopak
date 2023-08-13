import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/chat_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';
import 'package:hallopak/app/data/providers/user_provider.dart';

class CariSatpamController extends GetxController {
  final userProvider = UserProvider();
  final profileProvider = ProfileProvider();
  final chatProvider = ChatProvider();
  List<UserModel> users = [];
  List<ProfileModel> profiles = [];
  List<ChatModel> chats = [];

  Future<void> getUser() async {
    users = await userProvider.getUsers(role: SATPAM);
    // eliminasi user yang sudah ada chat
    for (var i = 0; i < users.length; i++) {
      for (var j = 0; j < chats.length; j++) {
        if (users[i].email == chats[j].satpam) {
          users.removeAt(i);
        }
      }
    }

    // get profile
    for (var i = 0; i < users.length; i++) {
      var profile = await profileProvider.getProfile(users[i].email!);
      profiles.add(profile);
    }
    update(['list']);
  }

  // findUser(String query) {
  //   var user = users.where((element) => element.email!.contains(query));
  //   return user;
  // }

  Future<void> getChat() async {
    chats = await chatProvider.getChats(role: WARGA, email: Get.find<LocalStorage>().user.email ?? '');
  }

  @override
  void onInit() async {
    super.onInit();
    await getChat();
    await getUser();
  }
}
