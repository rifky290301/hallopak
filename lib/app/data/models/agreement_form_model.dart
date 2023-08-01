import 'package:cloud_firestore/cloud_firestore.dart';

class AgreementFormModel {
  final String? warga;
  final String? satpam;
  final String? alamatPenempatan;
  final Timestamp? tanggalKontrak;
  final String? jamKerja;
  final String? setuju;
  final String? alasan;

  AgreementFormModel({
    this.warga,
    this.satpam,
    this.alamatPenempatan,
    this.tanggalKontrak,
    this.jamKerja,
    this.setuju,
    this.alasan,
  });

  AgreementFormModel copyWith({
    String? warga,
    String? satpam,
    String? alamatPenempatan,
    Timestamp? tanggalKontrak,
    String? jamKerja,
    String? setuju,
    String? alasan,
  }) =>
      AgreementFormModel(
        warga: warga ?? this.warga,
        satpam: satpam ?? this.satpam,
        alamatPenempatan: alamatPenempatan ?? this.alamatPenempatan,
        tanggalKontrak: tanggalKontrak ?? this.tanggalKontrak,
        jamKerja: jamKerja ?? this.jamKerja,
        setuju: setuju ?? this.setuju,
        alasan: alasan ?? this.alasan,
      );

  factory AgreementFormModel.fromJson(Map<String, dynamic> json) => AgreementFormModel(
        warga: json["warga"],
        satpam: json["satpam"],
        alamatPenempatan: json["alamat_penempatan"],
        tanggalKontrak: json["tanggal_kontrak"],
        jamKerja: json["jam_kerja"],
        setuju: json["setuju"],
        alasan: json["alasan"],
      );

  Map<String, dynamic> toJson() => {
        "warga": warga,
        "satpam": satpam,
        "alamat_penempatan": alamatPenempatan,
        "tanggal_kontrak": tanggalKontrak,
        "jam_kerja": jamKerja,
        "setuju": setuju,
        "alasan": alasan,
      };
}
