import 'dart:convert';

class TermsPrivacyPolicyModel {
  bool? success;
  int? code;
  String? message;
  Data? data;
  String? timestamp;

  TermsPrivacyPolicyModel({
    this.success,
    this.code,
    this.message,
    this.data,
    this.timestamp,
  });

  TermsPrivacyPolicyModel copyWith({
    bool? success,
    int? code,
    String? message,
    Data? data,
    String? timestamp,
  }) => TermsPrivacyPolicyModel(
    success: success ?? this.success,
    code: code ?? this.code,
    message: message ?? this.message,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  factory TermsPrivacyPolicyModel.fromRawJson(String str) =>
      TermsPrivacyPolicyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TermsPrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      TermsPrivacyPolicyModel(
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
  String? title;
  String? content;

  Data({this.title, this.content});

  Data copyWith({String? title, String? content}) =>
      Data(title: title ?? this.title, content: content ?? this.content);

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(title: json["title"], content: json["content"]);

  Map<String, dynamic> toJson() => {"title": title, "content": content};
}
