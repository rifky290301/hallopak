class ChatModel {
  final String? satpam;
  final String? warga;

  ChatModel({
    this.satpam,
    this.warga,
  });

  ChatModel copyWith({
    String? satpam,
    String? warga,
  }) =>
      ChatModel(
        satpam: satpam ?? this.satpam,
        warga: warga ?? this.warga,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        satpam: json["satpam"],
        warga: json["warga"],
      );

  Map<String, dynamic> toJson() => {
        "satpam": satpam,
        "warga": warga,
      };
}
