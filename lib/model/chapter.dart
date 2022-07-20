import 'dart:convert';

List<Chapter> chapterFromJson(String str) =>
    List<Chapter>.from(json.decode(str).map((x) => Chapter.fromJson(x)));

String chapterToJson(List<Chapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapter {
  Chapter({
    this.id,
    this.subjectId,
    required this.title,
    required this.description,
    this.file,
    required this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? subjectId;
  String title;
  String description;
  String? file;
  String price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        subjectId: json["subject_id"],
        title: json["title"],
        description: json["description"],
        file: json["file"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "title": title,
        "description": description,
        "file": file,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
