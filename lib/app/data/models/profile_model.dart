import 'package:cloud_firestore/cloud_firestore.dart';

const String MENIKAH = "Menikah";
const String BELUM_MENIKAH = "Belum Menikah";

class ProfileModel {
  final String? nama;
  final String? tempatLahir;
  final Timestamp? tanggalLahir;
  final String? nik;
  final String? noHp;
  final String? alamat;
  final String? pendidikanTerakhir;
  final String? status;
  final String? sertifikat;

  ProfileModel({
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.nik,
    this.noHp,
    this.alamat,
    this.pendidikanTerakhir,
    this.status,
    this.sertifikat,
  });

  ProfileModel copyWith({
    String? nama,
    String? tempatLahir,
    Timestamp? tanggalLahir,
    String? nik,
    String? noHp,
    String? alamat,
    String? pendidikanTerakhir,
    String? status,
    String? sertifikat,
  }) =>
      ProfileModel(
        nama: nama ?? this.nama,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        nik: nik ?? this.nik,
        noHp: noHp ?? this.noHp,
        alamat: alamat ?? this.alamat,
        pendidikanTerakhir: pendidikanTerakhir ?? this.pendidikanTerakhir,
        status: status ?? this.status,
        sertifikat: sertifikat ?? this.sertifikat,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        nama: json["nama"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        nik: json["nik"],
        noHp: json["no_hp"],
        alamat: json["alamat"],
        pendidikanTerakhir: json["pendidikan_terakhir"],
        status: json["status"],
        sertifikat: json["sertifikat"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "nik": nik,
        "no_hp": noHp,
        "alamat": alamat,
        "pendidikan_terakhir": pendidikanTerakhir,
        "status": status,
        "sertifikat": sertifikat,
      };
}
