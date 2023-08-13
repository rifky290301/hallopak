import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallopak/app/data/core/static/firestore_var.dart';

import '../models/conversation_model.dart';

class ConversationProvider {
  static final ConversationProvider _instance = ConversationProvider._internal();
  ConversationProvider._internal();
  factory ConversationProvider() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ConversationModel>> getConversationsStream(String id) {
    try {
      return _firestore
          .collection(FirestoreVar.chat)
          .doc(id)
          .collection(FirestoreVar.conversation)
          .orderBy('created_at', descending: false)
          .snapshots()
          .map(
            (value) => value.docs.map((e) => ConversationModel.fromFirestore(e)).toList(),
          );
    } catch (e) {
      return Stream.value([]);
    }
  }

  Future<List<ConversationModel>> getConversations(String id) async {
    try {
      return _firestore
          .collection(FirestoreVar.chat)
          .doc(id)
          .collection(FirestoreVar.conversation)
          .orderBy('created_at', descending: false)
          .get()
          .then(
            (value) => value.docs.map((e) => ConversationModel.fromFirestore(e)).toList(),
          );
    } catch (e) {
      return Future.value([]);
    }
  }

  Future<void> addConversation(String id, ConversationModel conversationModel) async {
    try {
      await _firestore
          .collection(FirestoreVar.chat)
          .doc(id)
          .collection(FirestoreVar.conversation)
          .add(conversationModel.toJson());
    } catch (e) {
      print(e.toString());
    }
  }
}
