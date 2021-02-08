import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/post/post.dart';
import '../database_service.dart';

class PostService {
  final databaseService = DatabaseService();

  // Get
  Stream<List<Post>> getPosts() {
    return databaseService.firebaseFirestore
        .collection('Posts')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((post) => Post.fromJson(post.data())).toList());
  }

  Stream<Post> getPost(String postId) {
    return databaseService.firebaseFirestore
        .collection('Posts')
        .doc(postId)
        .snapshots()
        .map((post) => Post.fromJson(post.data()));
  }

  // Upsert
  Future<void> setPost(Post post) {
    final options = SetOptions(merge: true);

    return databaseService.firebaseFirestore
        .collection('Posts')
        .doc(post.postId)
        .set(post.toJson(), options);
  }

  // Delete
  Future<void> removePost(String postId) {
    return databaseService.firebaseFirestore
        .collection('Posts')
        .doc(postId)
        .delete();
  }
}
