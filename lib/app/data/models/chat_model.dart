import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String? id;
  final String? satpam;
  final String? warga;
  final String? lastMessage;
  final Timestamp? lastMessageTime;
  final bool? isAcc;

  ChatModel({
    this.id,
    this.satpam,
    this.warga,
    this.lastMessage,
    this.lastMessageTime,
    this.isAcc,
  });

  ChatModel copyWith({
    String? id,
    String? satpam,
    String? warga,
    String? lastMessage,
    Timestamp? lastMessageTime,
    bool? isAcc,
  }) =>
      ChatModel(
        id: id ?? this.id,
        satpam: satpam ?? this.satpam,
        warga: warga ?? this.warga,
        lastMessage: lastMessage ?? this.lastMessage,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
        isAcc: isAcc ?? this.isAcc,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        satpam: json["satpam"],
        warga: json["warga"],
        lastMessage: json["last_message"],
        lastMessageTime: json["last_message_time"],
        isAcc: json["is_acc"],
      );

  Map<String, dynamic> toJson() => {
        "satpam": satpam,
        "warga": warga,
        "last_message": lastMessage,
        "last_message_time": lastMessageTime,
        "is_acc": isAcc,
      };

  factory ChatModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ChatModel(
      id: doc.id,
      satpam: data['satpam'],
      warga: data['warga'],
      lastMessage: data['last_message'],
      lastMessageTime: data['last_message_time'],
      isAcc: data['is_acc'],
    );
  }
}
