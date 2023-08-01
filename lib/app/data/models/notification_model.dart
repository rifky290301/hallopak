class NotificationModel {
  final String? judul;
  final String? deskripsi;
  final String? penerima;
  final String? dari;

  NotificationModel({
    this.judul,
    this.deskripsi,
    this.penerima,
    this.dari,
  });

  NotificationModel copyWith({
    String? judul,
    String? deskripsi,
    String? penerima,
    String? dari,
  }) =>
      NotificationModel(
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        penerima: penerima ?? this.penerima,
        dari: dari ?? this.dari,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        penerima: json["penerima"],
        dari: json["dari"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "deskripsi": deskripsi,
        "penerima": penerima,
        "dari": dari,
      };
}
