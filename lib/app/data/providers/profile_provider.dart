import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallopak/app/data/core/static/firestore_var.dart';

import '../../utils/snackbar_app.dart';
import '../models/profile_model.dart';

class ProfileProvider {
  static final ProfileProvider _instance = ProfileProvider._internal();
  ProfileProvider._internal();
  factory ProfileProvider() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileModel> getProfile(String email) async {
    try {
      var result = await _firestore.collection(FirestoreVar.profile).doc(email).get().then((value) => value);
      return ProfileModel.fromJson(result.data() ?? {});
    } catch (e) {
      errorSnackbar(e.toString());
      return ProfileModel();
    }
  }

  Future<void> updateProfile(ProfileModel profile, String email) async {
    try {
      await _firestore.collection(FirestoreVar.profile).doc(email).set(profile.toJson());
    } catch (e) {
      errorSnackbar(e.toString());
    }
  }
}
