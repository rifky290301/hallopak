class ComplaintModel {
  final String? judul;
  final String? deskripsi;
  final String? waktu;

  ComplaintModel({
    this.judul,
    this.deskripsi,
    this.waktu,
  });

  ComplaintModel copyWith({
    String? judul,
    String? deskripsi,
    String? waktu,
  }) =>
      ComplaintModel(
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        waktu: waktu ?? this.waktu,
      );

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "deskripsi": deskripsi,
        "waktu": waktu,
      };
}
