import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/ulasan_model.dart';
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
  List<ChatModel> allChats = [];
  List<UlasanModel> listUlasan = [];
  bool isLoad = true;

  Future<void> getUser() async {
    isLoad = true;
    try {
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

        // set rating
        double rating = 0;
        List<ChatModel> tempChats = allChats
            .where(
              (element) => element.satpam!.toLowerCase().contains(users[i].email!),
            )
            .toList();
        if (tempChats.isNotEmpty) {
          for (var i = 0; i < tempChats.length; i++) {
            rating += tempChats[i].bintang!;
          }
          listUlasan.add(
            UlasanModel(
              bintang: rating / tempChats.length,
              saran: tempChats[tempChats.length - 1].ulasan,
            ),
          );
        }
      }
      update(['list']);
    } catch (e) {
      printError(info: e.toString());
    }
    isLoad = false;
  }

  // findUser(String query) {
  //   var user = users.where((element) => element.email!.contains(query));
  //   return user;
  // }

  Future<void> getChat() async {
    chats = await chatProvider.getChats(role: WARGA, email: Get.find<LocalStorage>().user.email ?? '');
    // chats = allChats.where((element) => )
  }

  Future<void> getAllChat() async {
    allChats = await chatProvider.getAllChats();
  }

  @override
  void onInit() async {
    super.onInit();
    await getAllChat();
    await getChat();
    await getUser();
  }
}
