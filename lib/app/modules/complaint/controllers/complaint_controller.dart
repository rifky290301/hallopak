import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/data/providers/auth_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';

class ComplaintController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final globarKey = GlobalKey<FormState>();
  final _local = Get.find<LocalStorage>();
  TextEditingController? judulTEC;
  TextEditingController? deskripsiTEC;
  String? selectedEmail;
  Timestamp? tanggal;

  @override
  void onInit() {
    judulTEC = TextEditingController();
    deskripsiTEC = TextEditingController();
    super.onInit();
  }
}
