import 'dart:convert';

UlasanModel ulasanModelFromJson(String str) => UlasanModel.fromJson(json.decode(str));

String ulasanModelToJson(UlasanModel data) => json.encode(data.toJson());

class UlasanModel {
  final double? bintang;
  final String? saran;

  UlasanModel({
    this.bintang,
    this.saran,
  });

  UlasanModel copyWith({
    double? bintang,
    String? saran,
  }) =>
      UlasanModel(
        bintang: bintang ?? this.bintang,
        saran: saran ?? this.saran,
      );

  factory UlasanModel.fromJson(Map<String, dynamic> json) => UlasanModel(
        bintang: json["bintang"],
        saran: json["saran"],
      );

  Map<String, dynamic> toJson() => {
        "bintang": bintang,
        "saran": saran,
      };
}
