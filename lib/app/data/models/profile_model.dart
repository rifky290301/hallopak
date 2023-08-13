import 'package:cloud_firestore/cloud_firestore.dart';

const String MENIKAH = "Menikah";
const String BELUM_MENIKAH = "Belum Menikah";

class ProfileModel {
  final String? id;
  final String? nama;
  final String? tempatLahir;
  final Timestamp? tanggalLahir;
  final String? nik;
  final String? noHp;
  final String? alamat;
  final String? pendidikanTerakhir;
  final String? status;
  final String? sertifikat;
  final String? profile;

  ProfileModel({
    this.id,
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.nik,
    this.noHp,
    this.alamat,
    this.pendidikanTerakhir,
    this.status,
    this.sertifikat,
    this.profile,
  });

  ProfileModel copyWith({
    String? id,
    String? nama,
    String? tempatLahir,
    Timestamp? tanggalLahir,
    String? nik,
    String? noHp,
    String? alamat,
    String? pendidikanTerakhir,
    String? status,
    String? sertifikat,
    String? profile,
  }) =>
      ProfileModel(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        nik: nik ?? this.nik,
        noHp: noHp ?? this.noHp,
        alamat: alamat ?? this.alamat,
        pendidikanTerakhir: pendidikanTerakhir ?? this.pendidikanTerakhir,
        status: status ?? this.status,
        sertifikat: sertifikat ?? this.sertifikat,
        profile: profile ?? this.profile,
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
        profile: json["profile"],
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
        "profile": profile,
      };

  factory ProfileModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ProfileModel(
      id: doc.id,
      nama: data['nama'],
      tempatLahir: data['tempat_lahir'],
      tanggalLahir: data['tanggal_lahir'],
      nik: data['nik'],
      noHp: data['no_hp'],
      alamat: data['alamat'],
      pendidikanTerakhir: data['pendidikan_terakhir'],
      status: data['status'],
      sertifikat: data['sertifikat'],
      profile: data['profile'],
    );
  }
}
