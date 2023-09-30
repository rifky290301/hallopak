import 'dart:developer';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/complaint_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/providers/profile_provider.dart';

class DetailComplaintController extends GetxController {
  final _profileProvider = ProfileProvider();
  ProfileModel? profileSatpam, profileWarga;
  ComplaintModel? complaintModel;
  Future<void> getProfile() async {
    profileSatpam = await _profileProvider.getProfile(complaintModel!.satpam!);
    profileWarga = await _profileProvider.getProfile(complaintModel!.warga!);
    update();
  }

  @override
  void onInit() {
    complaintModel = Get.arguments;
    inspect(complaintModel);
    getProfile();
    super.onInit();
  }
}
