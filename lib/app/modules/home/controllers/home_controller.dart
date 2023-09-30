import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';

class HomeController extends GetxController {
  final _local = Get.find<LocalStorage>();
  final _profileProvider = ProfileProvider();
  List<Icon> iconList = [
    const Icon(CupertinoIcons.speaker_3_fill, size: 40),
    const Icon(CupertinoIcons.chat_bubble_2, size: 40),
    const Icon(CupertinoIcons.search, size: 40),
  ];
  List<String> titleList = ['Pengaduan', 'Chat', 'Cari Satpam'];
  ProfileModel? profileModel;

  UserModel? get user => _local.user;

  Future<void> getProfile() async {
    profileModel = await _profileProvider.getProfile(user!.email!);
    filterFiture();
    update();
  }

  void filterFiture() {
    if (user!.role == SATPAM) {
      iconList.removeAt(2);
      titleList.removeAt(2);
    }
    //  else {
    //   iconList.removeAt(0);
    //   titleList.removeAt(0);
    // }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
