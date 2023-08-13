import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';

import '../../../data/providers/chat_provider.dart';
import '../../../data/providers/local_storage.dart';

class ChatController extends GetxController {
  final _local = Get.find<LocalStorage>();
  final _chatProvider = ChatProvider();
  final _profileProvider = ProfileProvider();
  List<ProfileModel> listProfile = [];
  List<ChatModel> listChat = [];
  bool isLoad = true;

  UserModel? get user => _local.user;

  Future<void> getChat() async {
    isLoad = true;

    listChat = await _chatProvider.getChats(role: _local.user.role!, email: _local.user.email!);
    for (var i = 0; i < listChat.length; i++) {
      var profile = await _profileProvider.getProfile(
        user!.role == SATPAM ? listChat[i].warga! : listChat[i].satpam!,
      );
      listProfile.add(profile);
    }

    isLoad = false;
    update(['chat']);
  }

  set updateChat(ChatModel chatModel) {
    final index = listChat.indexWhere((element) => element.id == chatModel.id);
    listChat[index] = chatModel;
    _chatProvider.updateChat(chatModel);
    update(['chat']);
  }

  @override
  void onInit() async {
    await getChat();
    super.onInit();
  }
}
