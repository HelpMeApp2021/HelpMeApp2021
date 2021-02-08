import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/user/user.dart';
import '../database_service.dart';

class UserService {
  final databaseService = DatabaseService();

  // Get
  Stream<List<User>> getUsers() {
    return databaseService.firebaseFirestore
        .collection('Users')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((user) => User.fromJson(user.data())).toList());
  }

  Stream<User> getUser(String userId) {
    return databaseService.firebaseFirestore
        .collection('Users')
        .doc(userId)
        .snapshots()
        .map((user) => User.fromJson(user.data()));
  }

  // Upsert
  Future<void> setUser(User user) {
    final options = SetOptions(merge: true);

    return databaseService.firebaseFirestore
        .collection('Users')
        .doc(user.userId)
        .set(user.toJson(), options);
  }

  // Delete
  Future<void> removeUser(String userId) {
    return databaseService.firebaseFirestore
        .collection('Users')
        .doc(userId)
        .delete();
  }
}
