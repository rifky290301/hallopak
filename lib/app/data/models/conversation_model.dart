import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationModel {
  final String? grupTime;
  final bool? isRead;
  final String? penerima;
  final String? pengirim;
  final String? pesan;
  final Timestamp? time;

  ConversationModel({
    this.grupTime,
    this.isRead,
    this.penerima,
    this.pengirim,
    this.pesan,
    this.time,
  });

  ConversationModel copyWith({
    String? grupTime,
    bool? isRead,
    String? penerima,
    String? pengirim,
    String? pesan,
    Timestamp? time,
  }) =>
      ConversationModel(
        grupTime: grupTime ?? this.grupTime,
        isRead: isRead ?? this.isRead,
        penerima: penerima ?? this.penerima,
        pengirim: pengirim ?? this.pengirim,
        pesan: pesan ?? this.pesan,
        time: time ?? this.time,
      );

  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
        grupTime: json["grup_time"],
        isRead: json["is_read"],
        penerima: json["penerima"],
        pengirim: json["pengirim"],
        pesan: json["pesan"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "grup_time": grupTime,
        "is_read": isRead,
        "penerima": penerima,
        "pengirim": pengirim,
        "pesan": pesan,
        "time": time,
      };
}
