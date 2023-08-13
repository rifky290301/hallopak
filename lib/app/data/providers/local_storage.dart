import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hallopak/app/data/core/static/local_storage_var.dart';
import 'package:hallopak/app/data/models/user_model.dart';

class LocalStorage extends GetxController {
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  set storeUser(UserModel model) {
    box.write(LocalStorageVar.userModel, model.toJson());
  }

  UserModel get user => UserModel.fromJson(box.read(LocalStorageVar.userModel));
}
