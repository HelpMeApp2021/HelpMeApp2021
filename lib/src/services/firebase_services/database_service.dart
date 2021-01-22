import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference postsCollection =
    FirebaseFirestore.instance.collection("/Posts");

  Stream<QuerySnapshot> getCollectionSnapshotStream(String collection){
    return firebaseFirestore.collection(collection).snapshots();
  }

  // Future addDocument(String collection, Map<String,dynamic> data){
  //   return firebaseFirestore.collection(collection).add({
  //     data,
  //   });
  // }

Future addDocument(String collection, String titre, String reference, String description){
  return firebaseFirestore.collection(collection).add({
    "titre": titre,
    "reference": reference,
    "description": description
  });
}




}