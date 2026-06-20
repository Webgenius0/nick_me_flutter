import 'dart:convert';

class VirtuesModel {
  bool? success;
  int? code;
  String? message;
  List<Datum>? data;
  String? timestamp;

  VirtuesModel({
    this.success,
    this.code,
    this.message,
    this.data,
    this.timestamp,
  });

  VirtuesModel copyWith({
    bool? success,
    int? code,
    String? message,
    List<Datum>? data,
    String? timestamp,
  }) => VirtuesModel(
    success: success ?? this.success,
    code: code ?? this.code,
    message: message ?? this.message,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  factory VirtuesModel.fromRawJson(String str) =>
      VirtuesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VirtuesModel.fromJson(Map<String, dynamic> json) => VirtuesModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "timestamp": timestamp,
  };
}

class Datum {
  String? name;
  String? greekName;
  String? description;

  Datum({this.name, this.greekName, this.description});

  Datum copyWith({String? name, String? greekName, String? description}) =>
      Datum(
        name: name ?? this.name,
        greekName: greekName ?? this.greekName,
        description: description ?? this.description,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    greekName: json["greek_name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "greek_name": greekName,
    "description": description,
  };
}
