import 'dart:convert';

class WisdomGenerateModel {
  bool? success;
  int? code;
  String? message;
  WisdomData? data;
  String? timestamp;

  WisdomGenerateModel({
    this.success,
    this.code,
    this.message,
    this.data,
    this.timestamp,
  });

  factory WisdomGenerateModel.fromRawJson(String str) =>
      WisdomGenerateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WisdomGenerateModel.fromJson(Map<String, dynamic> json) =>
      WisdomGenerateModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : WisdomData.fromJson(json["data"]),
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

class WisdomData {
  Wisdom? wisdom;
  Author? author;
  bool? reflectionEnabled;
  String? reflection;
  bool? isSaved;
  String? shareLink;

  WisdomData({
    this.wisdom,
    this.author,
    this.reflectionEnabled,
    this.reflection,
    this.isSaved,
    this.shareLink,
  });

  factory WisdomData.fromJson(Map<String, dynamic> json) => WisdomData(
        wisdom: json["wisdom"] == null
            ? null
            : Wisdom.fromJson(json["wisdom"]),
        author: json["author"] == null
            ? null
            : Author.fromJson(json["author"]),
        reflectionEnabled: json["reflection_enabled"],
        reflection: json["reflection"],
        isSaved: json["is_saved"],
        shareLink: json["share_link"],
      );

  Map<String, dynamic> toJson() => {
        "wisdom": wisdom?.toJson(),
        "author": author?.toJson(),
        "reflection_enabled": reflectionEnabled,
        "reflection": reflection,
        "is_saved": isSaved,
        "share_link": shareLink,
      };
}

class Wisdom {
  String? stoic;
  String? slug;
  String? book;
  String? chapter;

  Wisdom({
    this.stoic,
    this.slug,
    this.book,
    this.chapter,
  });

  factory Wisdom.fromJson(Map<String, dynamic> json) => Wisdom(
        stoic: json["stoic"],
        slug: json["slug"],
        book: json["book"],
        chapter: json["chapter"],
      );

  Map<String, dynamic> toJson() => {
        "stoic": stoic,
        "slug": slug,
        "book": book,
        "chapter": chapter,
      };
}

class Author {
  String? slug;
  String? name;

  Author({this.slug, this.name});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };
}
