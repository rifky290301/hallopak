import 'package:cloud_firestore/cloud_firestore.dart';

class AgreementFormModel {
  final String? id;
  final String? warga;
  final String? satpam;
  final String? alamatPenempatan;
  final Timestamp? tanggalKontrakMulai;
  final Timestamp? tanggalKontrakSelesai;
  final String? jamKerja;
  final String? gaji;
  final String? alasan;
  final bool? isAcc;

  AgreementFormModel({
    this.id,
    this.warga,
    this.satpam,
    this.alamatPenempatan,
    this.tanggalKontrakMulai,
    this.tanggalKontrakSelesai,
    this.jamKerja,
    this.gaji,
    this.alasan,
    this.isAcc,
  });

  AgreementFormModel copyWith({
    String? id,
    String? warga,
    String? satpam,
    String? alamatPenempatan,
    Timestamp? tanggalKontrakMulai,
    Timestamp? tanggalKontrakSelesai,
    String? jamKerja,
    String? gaji,
    String? alasan,
    bool? isAcc,
  }) =>
      AgreementFormModel(
        id: id ?? this.id,
        warga: warga ?? this.warga,
        satpam: satpam ?? this.satpam,
        alamatPenempatan: alamatPenempatan ?? this.alamatPenempatan,
        tanggalKontrakMulai: tanggalKontrakMulai ?? this.tanggalKontrakMulai,
        tanggalKontrakSelesai: tanggalKontrakSelesai ?? this.tanggalKontrakSelesai,
        jamKerja: jamKerja ?? this.jamKerja,
        gaji: gaji ?? this.gaji,
        alasan: alasan ?? this.alasan,
        isAcc: isAcc ?? this.isAcc,
      );

  factory AgreementFormModel.fromJson(Map<String, dynamic> json) => AgreementFormModel(
        warga: json["warga"],
        satpam: json["satpam"],
        alamatPenempatan: json["alamat_penempatan"],
        tanggalKontrakMulai: json["tanggal_kontrak_mulai"],
        tanggalKontrakSelesai: json["tanggal_kontrak_selesai"],
        jamKerja: json["jam_kerja"],
        gaji: json["gaji"],
        alasan: json["alasan"],
        isAcc: json["is_acc"],
      );

  Map<String, dynamic> toJson() => {
        "warga": warga,
        "satpam": satpam,
        "alamat_penempatan": alamatPenempatan,
        "tanggal_kontrak_mulai": tanggalKontrakMulai,
        "tanggal_kontrak_selesai": tanggalKontrakSelesai,
        "jam_kerja": jamKerja,
        "gaji": gaji,
        "alasan": alasan,
        "is_acc": isAcc,
      };

  factory AgreementFormModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return AgreementFormModel(
      id: doc.id,
      warga: json["warga"],
      satpam: json["satpam"],
      alamatPenempatan: json["alamat_penempatan"],
      tanggalKontrakMulai: json["tanggal_kontrak_mulai"],
      tanggalKontrakSelesai: json["tanggal_kontrak_selesai"],
      jamKerja: json["jam_kerja"],
      gaji: json["gaji"],
      alasan: json["alasan"],
      isAcc: json["is_acc"],
    );
  }
}
