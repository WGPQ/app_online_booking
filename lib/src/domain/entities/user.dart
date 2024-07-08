import 'dart:convert';

List<CustomUser> customUserFromJson(String str) =>
    List<CustomUser>.from(json.decode(str).map((x) => CustomUser.fromJson(x)));

class CustomUser {
  String? avatar;
  String name;
  String email;
  String? phone;
  String? nationality;
  String? bod;
  String? password;

  CustomUser({
    this.avatar,
    this.phone,
    this.bod,
    this.password,
    this.nationality,
    required this.email,
    required this.name,
  });

  factory CustomUser.fromJson(Map<String, dynamic> json) => CustomUser(
        avatar: json["avatar"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        nationality: json["nationality"],
        bod: json["bod"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "avatar": avatar,
        "phone": phone,
        "nationality": nationality,
        "bod": bod,
        "password": password,
      };
}
