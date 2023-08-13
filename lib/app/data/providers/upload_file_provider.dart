import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadFileProvide {
  static final UploadFileProvide _instance = UploadFileProvide._internal();
  UploadFileProvide._internal();
  factory UploadFileProvide() => _instance;

  final storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadFile(File file, String location) async {
    try {
      var fileName = file.path.split('/').last;
      var uploadTask = storageRef.child('$location/$fileName').putFile(file);
      var snapshot = await uploadTask.whenComplete(() => null);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  Future<void> deleteFile(String location) async {
    try {
      await storageRef.child(location).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
