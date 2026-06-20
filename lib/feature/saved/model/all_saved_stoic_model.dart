import 'dart:convert';

class AllSavedStoicModel {
  bool? success;
  int? code;
  String? message;
  Data? data;
  String? timestamp;

  AllSavedStoicModel({
    this.success,
    this.code,
    this.message,
    this.data,
    this.timestamp,
  });

  AllSavedStoicModel copyWith({
    bool? success,
    int? code,
    String? message,
    Data? data,
    String? timestamp,
  }) => AllSavedStoicModel(
    success: success ?? this.success,
    code: code ?? this.code,
    message: message ?? this.message,
    data: data ?? this.data,
    timestamp: timestamp ?? this.timestamp,
  );

  factory AllSavedStoicModel.fromRawJson(String str) =>
      AllSavedStoicModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllSavedStoicModel.fromJson(Map<String, dynamic> json) =>
      AllSavedStoicModel(
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
  List<Item>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data copyWith({List<Item>? items, Pagination? pagination}) => Data(
    items: items ?? this.items,
    pagination: pagination ?? this.pagination,
  );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: json["items"] == null
        ? []
        : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    pagination: json["pagination"] == null
        ? null
        : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null
        ? []
        : List<dynamic>.from(items!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Item {
  Wisdom? wisdom;
  Author? author;
  String? shareLink;
  bool? isSaved;
  DateTime? savedAt;

  Item({this.wisdom, this.author, this.shareLink, this.isSaved, this.savedAt});

  Item copyWith({
    Wisdom? wisdom,
    Author? author,
    String? shareLink,
    bool? isSaved,
    DateTime? savedAt,
  }) => Item(
    wisdom: wisdom ?? this.wisdom,
    author: author ?? this.author,
    shareLink: shareLink ?? this.shareLink,
    isSaved: isSaved ?? this.isSaved,
    savedAt: savedAt ?? this.savedAt,
  );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    wisdom: json["wisdom"] == null ? null : Wisdom.fromJson(json["wisdom"]),
    author: json["author"] == null ? null : Author.fromJson(json["author"]),
    shareLink: json["share_link"],
    isSaved: json["is_saved"],
    savedAt: json["saved_at"] == null ? null : DateTime.parse(json["saved_at"]),
  );

  Map<String, dynamic> toJson() => {
    "wisdom": wisdom?.toJson(),
    "author": author?.toJson(),
    "share_link": shareLink,
    "is_saved": isSaved,
    "saved_at": savedAt?.toIso8601String(),
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

class Wisdom {
  String? stoic;
  String? slug;
  String? book;
  String? chapter;

  Wisdom({this.stoic, this.slug, this.book, this.chapter});

  Wisdom copyWith({
    String? stoic,
    String? slug,
    String? book,
    String? chapter,
  }) => Wisdom(
    stoic: stoic ?? this.stoic,
    slug: slug ?? this.slug,
    book: book ?? this.book,
    chapter: chapter ?? this.chapter,
  );

  factory Wisdom.fromRawJson(String str) => Wisdom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class Pagination {
  int? currentPage;
  int? perPage;
  int? total;
  int? lastPage;
  int? from;
  int? to;

  Pagination({
    this.currentPage,
    this.perPage,
    this.total,
    this.lastPage,
    this.from,
    this.to,
  });

  Pagination copyWith({
    int? currentPage,
    int? perPage,
    int? total,
    int? lastPage,
    int? from,
    int? to,
  }) => Pagination(
    currentPage: currentPage ?? this.currentPage,
    perPage: perPage ?? this.perPage,
    total: total ?? this.total,
    lastPage: lastPage ?? this.lastPage,
    from: from ?? this.from,
    to: to ?? this.to,
  );

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    total: json["total"],
    lastPage: json["last_page"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "total": total,
    "last_page": lastPage,
    "from": from,
    "to": to,
  };
}
