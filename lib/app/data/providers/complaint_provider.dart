import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/snackbar_app.dart';
import '../core/static/firestore_var.dart';
import '../models/complaint_model.dart';

class ComplaintProvider {
  static final ComplaintProvider _instance = ComplaintProvider._internal();
  ComplaintProvider._internal();
  factory ComplaintProvider() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ComplaintModel>> getComplaints({String? emailWarga, String? emailSatpam}) async {
    try {
      return _firestore
          .collection(FirestoreVar.complaint)
          .where('satpam', isEqualTo: emailSatpam)
          .where('warga', isEqualTo: emailWarga)
          .get()
          .then(
            (value) => value.docs.map((e) => ComplaintModel.fromFirestore(e)).toList(),
          );
    } catch (e) {
      errorSnackbar(e.toString());
      return Future.value([]);
    }
  }

  Future<void> addComplaint(ComplaintModel complaint) async {
    try {
      await _firestore.collection(FirestoreVar.complaint).add(complaint.toJson());
    } catch (e) {
      errorSnackbar(e.toString());
    }
  }

  Future<ComplaintModel> detailComplaint(String id) async {
    try {
      return _firestore
          .collection(FirestoreVar.complaint)
          .doc(id)
          .get()
          .then((value) => ComplaintModel.fromFirestore(value));
    } catch (e) {
      errorSnackbar(e.toString());
      return Future.value(ComplaintModel());
    }
  }
}
