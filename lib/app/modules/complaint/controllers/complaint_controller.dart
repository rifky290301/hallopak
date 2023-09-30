import 'package:get/get.dart';
import 'package:hallopak/app/data/models/complaint_model.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/data/providers/complaint_provider.dart';
import 'package:hallopak/app/data/providers/local_storage.dart';

class ComplaintController extends GetxController {
  final _local = Get.find<LocalStorage>().user;
  final complaintProvider = ComplaintProvider();
  List<ComplaintModel> complaints = [];
  String get role => _local.role!;
  bool isLoad = true;

  Future<void> getComplaints() async {
    isLoad = true;
    String? emailSatpam;
    String? emailWarga;
    if (_local.role == WARGA) {
      emailSatpam = null;
      emailWarga = _local.email;
    } else {
      emailSatpam = _local.email;
      emailWarga = null;
    }

    complaints = await complaintProvider.getComplaints(
      emailSatpam: emailSatpam,
      emailWarga: emailWarga,
    );
    isLoad = false;
    update();
  }

  void addComplaint(ComplaintModel model) async {
    complaints.add(model);
    update();
  }

  @override
  void onInit() {
    getComplaints();
    super.onInit();
  }
}
