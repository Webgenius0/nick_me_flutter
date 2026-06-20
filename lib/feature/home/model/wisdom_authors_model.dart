import 'dart:convert';

class WisdomAuthorsModel {
  bool? success;
  int? code;
  String? message;
  Data? data;
  String? timestamp;

  WisdomAuthorsModel({
    this.success,
    this.code,
    this.message,
    this.data,
    this.timestamp,
  });

  WisdomAuthorsModel copyWith({
    bool? success,
    int? code,
    String? message,
    Data? data,
    String? timestamp,
  }) => WisdomAuthorsModel(
    success: success ?? this.success,
    code: code ?? this.code,
    message: message ?? this.message,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  factory WisdomAuthorsModel.fromRawJson(String str) =>
      WisdomAuthorsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WisdomAuthorsModel.fromJson(Map<String, dynamic> json) =>
      WisdomAuthorsModel(
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
  List<Author>? authors;

  Data({this.authors});

  Data copyWith({List<Author>? authors}) =>
      Data(authors: authors ?? this.authors);

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    authors: json["authors"] == null
        ? []
        : List<Author>.from(json["authors"]!.map((x) => Author.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "authors": authors == null
        ? []
        : List<dynamic>.from(authors!.map((x) => x.toJson())),
  };
}

class Author {
  String? slug;
  String? name;

  Author({this.slug, this.name});

  Author copyWith({String? slug, String? name}) =>
      Author(slug: slug ?? this.slug, name: name ?? this.name);

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(slug: json["slug"], name: json["name"]);

  Map<String, dynamic> toJson() => {"slug": slug, "name": name};
}
