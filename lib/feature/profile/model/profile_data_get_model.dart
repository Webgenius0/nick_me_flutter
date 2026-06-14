import 'dart:convert';

class ProfileDataGetModel {
  bool? success;
  int? code;
  String? message;
  Data? data;
  String? timestamp;

  ProfileDataGetModel({
    this.success,
    this.code,
    this.message,
    this.data,
    this.timestamp,
  });

  ProfileDataGetModel copyWith({
    bool? success,
    int? code,
    String? message,
    Data? data,
    String? timestamp,
  }) => ProfileDataGetModel(
    success: success ?? this.success,
    code: code ?? this.code,
    message: message ?? this.message,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  factory ProfileDataGetModel.fromRawJson(String str) =>
      ProfileDataGetModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileDataGetModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataGetModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data?.toJson(),
    "timestamp": timestamp,
  };
}

class Data {
  User? user;

  Data({this.user});

  Data copyWith({User? user}) => Data(user: user ?? this.user);

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(user: json["user"] == null ? null : User.fromJson(json["user"]));

  Map<String, dynamic> toJson() => {"user": user?.toJson()};
}

class User {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;

  User({this.username, this.firstName, this.lastName, this.email, this.avatar});

  User copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? avatar,
  }) => User(
    username: username ?? this.username,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    avatar: avatar ?? this.avatar,
  );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "avatar": avatar,
  };
}
