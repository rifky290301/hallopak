import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallopak/app/data/core/static/firestore_var.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

class UserProvider {
  static final UserProvider _instance = UserProvider._internal();
  UserProvider._internal();
  factory UserProvider() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String email, String role) async {
    try {
      await _firestore.collection(FirestoreVar.users).add({
        'email': email,
        'role': role,
      });
    } catch (e) {
      errorSnackbar(e.toString());
    }
  }

  Future<UserModel> getUser(String email) async {
    try {
      var result = await _firestore.collection(FirestoreVar.users).where('email', isEqualTo: email).get().then(
            (value) => value.docs.first,
          );
      inspect(result.data());
      return UserModel.fromJson(result.data());
    } catch (e) {
      errorSnackbar(e.toString());
      return UserModel();
    }
  }

  Future<List<UserModel>> getUsers({String? role}) async {
    try {
      var result = await _firestore.collection(FirestoreVar.users).where('role', isEqualTo: role).get();
      return result.docs.map((e) => UserModel.fromJson(e.data())).toList();
    } catch (e) {
      errorSnackbar('Error get users: $e');
      return [];
    }
  }
}
