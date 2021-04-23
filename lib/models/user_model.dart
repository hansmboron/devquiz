import 'dart:convert';

class UserModel {
  final String name;
  final String phothUrl;
  final int score;

  UserModel({
    required this.name,
    required this.phothUrl,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phothUrl': phothUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      phothUrl: map['phothUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
