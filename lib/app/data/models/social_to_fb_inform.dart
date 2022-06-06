// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocialToFbInform {
  final String id;
  final String displayName;
  final String email;
  final String platform;
  SocialToFbInform(
      {required this.id,
      required this.displayName,
      required this.email,
      required this.platform});

  Map<String, String> toMap() {
    return <String, String>{
      'id': id,
      'displayName': displayName,
      'email': email,
      'platform': platform,
    };
  }

  factory SocialToFbInform.fromMap(Map<String, dynamic> map) {
    return SocialToFbInform(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      platform: map['platform'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialToFbInform.fromJson(String source) =>
      SocialToFbInform.fromMap(json.decode(source) as Map<String, dynamic>);
}
