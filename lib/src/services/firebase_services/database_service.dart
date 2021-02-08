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
    return firebaseFirestore.collection(collection).add({
      'titre': titre,
      'appareil': appareil,
      'description': description,
      'upvotes': [],
      'downvotes': [],
      'resolu': false,
      'tags': [],
      'reponses': []
    });
  }

  Future<DocumentReference> addReply(
      String id, String user, String texte) async {
    var reponses = List<dynamic>.empty();

    var doc = firebaseFirestore.collection('Posts').doc(id);

    await doc.get().then((doc) {
      if (doc.exists) {
        reponses = doc.data()['reponses'] as List<dynamic>;

        var _data = Map<String, dynamic>();

        _data['texte'] = texte;
        _data['user'] = user;
        _data['upvotes'] = [];
        _data['downvotes'] = [];

        reponses.add(_data);
      }
    });

    if (reponses.isNotEmpty) {
      await doc.update({'reponses': reponses});
    }
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
