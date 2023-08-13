import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallopak/app/data/core/static/firestore_var.dart';
import 'package:hallopak/app/data/models/agreement_form_model.dart';
import 'package:hallopak/app/data/models/chat_model.dart';

class AgreementFormProvider {
  static final AgreementFormProvider _instance = AgreementFormProvider._internal();
  AgreementFormProvider._internal();
  factory AgreementFormProvider() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAgreementForm(String idChat, AgreementFormModel data) async {
    try {
      await _firestore
          .collection(FirestoreVar.chat)
          .doc(idChat)
          .collection(FirestoreVar.agreementForm)
          .add(data.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateAgreementForm(String idChat, String idAgreementForm, AgreementFormModel data) async {
    try {
      await _firestore
          .collection(FirestoreVar.chat)
          .doc(idChat)
          .collection(FirestoreVar.agreementForm)
          .doc(data.id)
          .update(data.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<AgreementFormModel> getAgreementForm(String idChat) async {
    try {
      final data =
          await _firestore.collection(FirestoreVar.chat).doc(idChat).collection(FirestoreVar.agreementForm).get();
      return AgreementFormModel.fromFirestore(data.docs.first);
    } catch (e) {
      print(e.toString());
      return AgreementFormModel();
    }
  }

  Future<List<AgreementFormModel>> getAgreementFormList(String email) async {
    try {
      List<ChatModel> data = [];
      await _firestore.collection(FirestoreVar.chat).where('email', isEqualTo: email).get().then((value) {
        for (var element in value.docs) {
          data.add(ChatModel.fromFirestore(element));
        }
      });
      List<AgreementFormModel> agreementFormList = [];
      await Future.forEach(data, (element) async {
        await _firestore
            .collection(FirestoreVar.chat)
            .doc(element.id)
            .collection(FirestoreVar.agreementForm)
            .where('is_acc', isEqualTo: true)
            .get()
            .then((value) {
          for (var element in value.docs) {
            agreementFormList.add(AgreementFormModel.fromFirestore(element));
          }
        });
      });
      return agreementFormList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
