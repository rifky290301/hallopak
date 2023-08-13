import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/models/chat_model.dart';
import 'package:hallopak/app/data/models/conversation_model.dart';
import 'package:hallopak/app/data/models/profile_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/agreement_form_provider.dart';
import 'package:hallopak/app/data/providers/conversation_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';
import 'package:hallopak/app/modules/chat/controllers/chat_controller.dart';
import 'package:intl/intl.dart';

class ConversationController extends GetxController {
  final _local = Get.find<LocalStorage>();
  final _chatController = Get.find<ChatController>();
  final _conversationProvider = ConversationProvider();
  final _agreementFormProvider = AgreementFormProvider();
  TextEditingController? pesanTEC;
  ChatModel? chatModel;
  ProfileModel? profileModel;
  bool isAnyForm = false;

  UserModel get user => _local.user;
  String get lawanChat => user.role == SATPAM ? chatModel!.warga! : chatModel!.satpam!;

  Stream<List<ConversationModel>> getConversationsStream() {
    var tes = _conversationProvider.getConversationsStream(chatModel!.id!);
    return tes;
  }

  void gettest() {
    _conversationProvider.getConversations(chatModel!.id!).then((value) => inspect(value));
  }

  Future<void> addConversation() async {
    // update list chat
    chatModel = chatModel!.copyWith(
      lastMessage: pesanTEC!.text,
      lastMessageTime: Timestamp.now(),
    );
    _chatController.updateChat = chatModel!;

    // add conversation
    final conversationModel = ConversationModel(
      pengirim: user.email,
      penerima: lawanChat,
      pesan: pesanTEC!.text,
      createdAt: Timestamp.now(),
      grupTime: DateFormat.yMMMMd('en_US').format(DateTime.parse(DateTime.now().toIso8601String())),
      isRead: false,
    );
    await _conversationProvider.addConversation(chatModel!.id!, conversationModel);
    pesanTEC!.clear();
  }

  Future<void> getAgreementForm() async {
    await _agreementFormProvider.getAgreementForm(chatModel!.id!).then((value) {
      isAnyForm = value.id == null ? false : true;
      update(['agreement_form']);
    });
  }

  @override
  void onInit() {
    pesanTEC = TextEditingController();
    chatModel = Get.arguments[0] as ChatModel;
    profileModel = Get.arguments[1] as ProfileModel;
    getAgreementForm();

    // gettest();
    super.onInit();
  }
}
