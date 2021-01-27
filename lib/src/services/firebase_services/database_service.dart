import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;

  Stream<QuerySnapshot> getCollectionSnapshotStream(String collection) {
    return firebaseFirestore.collection(collection).snapshots();
  }

  // Future addDocument(String collection, Map<String,dynamic> data){
  //   return firebaseFirestore.collection(collection).add({
  //     data,
  //   });
  // }

  Future<DocumentReference> addPost(
      String collection, String titre, String appareil, String description) {
    return firebaseFirestore.collection(collection).add(
        { 'titre': titre,
          'appareil': appareil,
          'description': description,
          'upvotes':[],
          'downvotes':[],
          'resolu':false,
          'tags':[]
        });
  }

  Future<DocumentReference> addReply(
      String collection, String id, String nom, String texte) {
    return firebaseFirestore.collection(collection).add({
      'post_id': id,
      'user': nom,
      'text': texte,
      'upvotes': [],
      'downvotes': []
    });
  }

  Future<DocumentSnapshot> getDocument(String collection, String id) {
    return firebaseFirestore.collection(collection).doc(id).get();
  }

  Future<DocumentSnapshot> getDocumentWithDocumentReference(
      DocumentReference documentReference) {
    return firebaseFirestore
        .collection(documentReference.parent.id)
        .doc(documentReference.id)
        .get();
  }

  CollectionReference getCollectionReference(String collection) {
    return firebaseFirestore.collection(collection);
  }
}
