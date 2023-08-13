import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {
  final String? satpam;
  final String? warga;
  final String? judul;
  final String? deskripsi;
  final Timestamp? waktu;

  ComplaintModel({
    this.satpam,
    this.warga,
    this.judul,
    this.deskripsi,
    this.waktu,
  });

  ComplaintModel copyWith({
    String? satpam,
    String? warga,
    String? judul,
    String? deskripsi,
    Timestamp? waktu,
  }) =>
      ComplaintModel(
        satpam: satpam ?? this.satpam,
        warga: warga ?? this.warga,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        waktu: waktu ?? this.waktu,
      );

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
        satpam: json["satpam"],
        warga: json["warga"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "satpam": satpam,
        "warga": warga,
        "judul": judul,
        "deskripsi": deskripsi,
        "waktu": waktu,
      };

  factory ComplaintModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ComplaintModel(
      satpam: data['satpam'],
      warga: data['warga'],
      judul: data['judul'],
      deskripsi: data['deskripsi'],
      waktu: data['waktu'],
    );
  }
}
