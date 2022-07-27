import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@HiveType(typeId: 1)
class UserModel extends HiveObject {
    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.gender,
        required this.status,
    });
  @HiveField(0)
    int id;
  @HiveField(1)
    String name;
  @HiveField(2)
    String email;
  @HiveField(3)
    String gender;
  @HiveField(4)
    String status;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
    };

    @override
  get key => id;
}
