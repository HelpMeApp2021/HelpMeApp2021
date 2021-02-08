import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  User(
      {@required this.userId,
      this.postsRefs,
      this.appareils,
      this.abonnmnt,
      this.listenotifs});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
        userId: jsonData['userId'].toString(),
        postsRefs: jsonData['postsRefs'] as List<String>,
        appareils: jsonData['appareils'] as List<String>,
        abonnmnt: jsonData['abonnmnt'] as List<String>,
        listenotifs: jsonData['listenotifs'] as List<String>);
  }

  final String userId;
  final List<String> postsRefs;
  final List<String> appareils;
  final List<String> abonnmnt;
  final List<String> listenotifs;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'postsRefs': postsRefs,
      'appareils': appareils,
      'abonnmnt': abonnmnt,
      'listenotifs': listenotifs
    };
  }
}
