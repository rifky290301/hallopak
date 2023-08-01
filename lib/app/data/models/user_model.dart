const String WARGA = "warga";
const String SATPAM = "satpam";

class UserModel {
  final String? email;
  final String? role;

  UserModel({
    this.email,
    this.role,
  });

  UserModel copyWith({
    String? email,
    String? role,
  }) =>
      UserModel(
        email: email ?? this.email,
        role: role ?? this.role,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "role": role,
      };
}
