import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationModel {
  final String? id;
  final String? grupTime;
  final bool? isRead;
  final String? penerima;
  final String? pengirim;
  final String? pesan;
  final Timestamp? createdAt;

  ConversationModel({
    this.id,
    this.grupTime,
    this.isRead,
    this.penerima,
    this.pengirim,
    this.pesan,
    this.createdAt,
  });

  ConversationModel copyWith({
    String? id,
    String? grupTime,
    bool? isRead,
    String? penerima,
    String? pengirim,
    String? pesan,
    Timestamp? createdAt,
  }) =>
      ConversationModel(
        id: id ?? this.id,
        grupTime: grupTime ?? this.grupTime,
        isRead: isRead ?? this.isRead,
        penerima: penerima ?? this.penerima,
        pengirim: pengirim ?? this.pengirim,
        pesan: pesan ?? this.pesan,
        createdAt: createdAt ?? this.createdAt,
      );

  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
        grupTime: json["grup_time"],
        isRead: json["is_read"],
        penerima: json["penerima"],
        pengirim: json["pengirim"],
        pesan: json["pesan"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "grup_time": grupTime,
        "is_read": isRead,
        "penerima": penerima,
        "pengirim": pengirim,
        "pesan": pesan,
        "created_at": createdAt,
      };

  factory ConversationModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ConversationModel(
      id: doc.id,
      grupTime: data['grup_time'],
      isRead: data['is_read'],
      penerima: data['penerima'],
      pengirim: data['pengirim'],
      pesan: data['pesan'],
      createdAt: data['created_at'],
    );
  }
}
