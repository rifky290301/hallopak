import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hallopak/app/data/core/static/firestore_var.dart';
import 'package:hallopak/app/utils/snackbar_app.dart';

import '../models/chat_model.dart';

class ChatProvider {
  static final ChatProvider _instance = ChatProvider._internal();
  ChatProvider._internal();
  factory ChatProvider() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ChatModel>> getChats({required String role, required String email, bool? isAcc}) async {
    try {
      return _firestore
          .collection(FirestoreVar.chat)
          .where(role, isEqualTo: email)
          .where('is_acc', isEqualTo: isAcc)
          .orderBy('last_message_time', descending: true)
          .get()
          .then(
            (value) => value.docs.map((e) => ChatModel.fromFirestore(e)).toList(),
          );
    } catch (e) {
      errorSnackbar('terjadi kesalahan');
      debugPrint(e.toString());
      return Future.value([]);
    }
  }

  Future<List<ChatModel>> getAllChats() async {
    try {
      return _firestore.collection(FirestoreVar.chat).get().then(
            (value) => value.docs.map((e) => ChatModel.fromFirestore(e)).toList(),
          );
    } catch (e) {
      errorSnackbar('terjadi kesalahan');
      debugPrint(e.toString());
      return Future.value([]);
    }
  }

  Stream<List<ChatModel>> getChatsStream(String role, String email) {
    try {
      return _firestore.collection(FirestoreVar.chat).where(role, isEqualTo: email).snapshots().map(
            (value) => value.docs.map((e) => ChatModel.fromFirestore(e)).toList(),
          );
    } catch (e) {
      errorSnackbar(e.toString());
      return Stream.value([]);
    }
  }

  Future<ChatModel> addChat(ChatModel chatModel) async {
    // try {
    //   await _firestore.collection(FirestoreVar.chat).add(chatModel.toJson());
    // } catch (e) {
    //   errorSnackbar(e.toString());
    // }
    try {
      final doc = await _firestore.collection(FirestoreVar.chat).add(chatModel.toJson());
      return chatModel.copyWith(id: doc.id);
    } catch (e) {
      errorSnackbar(e.toString());
      return chatModel;
    }
  }

  Future<void> updateChat(ChatModel chatModel) async {
    try {
      await _firestore.collection(FirestoreVar.chat).doc(chatModel.id).update(chatModel.toJson());
    } catch (e) {
      errorSnackbar(e.toString());
    }
  }
}
