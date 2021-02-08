import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post {
  Post(
      {@required this.postId,
      this.appareil,
      this.description,
      this.downvotes,
      this.reponses,
      this.resolu,
      this.suiveurs,
      this.tags,
      this.titre,
      this.upvotes});

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
      postId: jsonData['postId'].toString(),
      appareil: jsonData['appareil'].toString(),
      description: jsonData['description'].toString(),
      downvotes: jsonData['downvotes'] as List<String>,
      reponses: jsonData['reponses'] as List<Map<String, dynamic>>,
      resolu: jsonData['resolu'] as bool,
      suiveurs: jsonData['suiveurs'] as List<String>,
      tags: jsonData['tags'] as List<String>,
      titre: jsonData['titre'].toString(),
      upvotes: jsonData['upvotes'] as List<String>,
    );
  }

  final String postId;
  final String appareil;
  final String description;
  final List<String> downvotes;
  final List<Map<String, dynamic>> reponses;
  final bool resolu;
  final List<String> suiveurs;
  final List<String> tags;
  final String titre;
  final List<String> upvotes;

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'appareil': appareil,
      'description': description,
      'downvotes': downvotes,
      'reponses': reponses,
      'resolu': resolu,
      'suiveurs': suiveurs,
      'tags': tags,
      'titre': titre,
      'upvotes': upvotes,
    };
  }
}
