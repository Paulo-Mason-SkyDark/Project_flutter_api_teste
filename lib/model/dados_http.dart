import 'dart:convert';

DadosPost dadosFromMap(String str) => DadosPost.fromMap(json.decode(str));

String dadosToMap(DadosPost data) => json.encode(data.toMap());

class DadosPost {
  final int userId;
  final int id;
  final String title;
  final String body;

  DadosPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory DadosPost.fromMap(Map<String, dynamic> json) => DadosPost(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
