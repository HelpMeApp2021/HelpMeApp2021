import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/firebase_services/database_service.dart';
import '../../problem_view_page/problem_view_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();
    final _firebaseUser = context.watch<User>();

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _databaseService.getCollectionSnapshotStream('Posts'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scrollbar(
            child: ListView(
              children: snapshot.data.docs
                  .where((document) =>
          document['titre']
              .toString()
              .toLowerCase()
              .contains(context.watch<TextEditingController>().text.trim().toLowerCase())
              )
              .map((document)  {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProblemViewPage(documentId: document.id)));
                    },
                    leading: CachedNetworkImage(
                      //TODO : changer l'image pour qu'elle corresponde au probleme.
                      imageUrl:
                      'https://image.flaticon.com/icons/png/512/40/40031.png',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 5, top: 5, bottom: 5, right: 5),
                    subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (document['appareil'] != null)
                                  Text.rich(TextSpan(
                                    text: document['appareil'].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                                const Padding(padding: EdgeInsets.only(top: 5)),
                                if (document['description'] != null)
                                  Text.rich(TextSpan(
                                    text: document['description'].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                                const Padding(padding: EdgeInsets.only(top: 5)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        color: Colors.green),
                                    color: Colors.white,
                                    onPressed: () {
                                      registerUpVote(document, _firebaseUser.uid, _databaseService);
                                    },
                                  ),
                                  Text.rich(TextSpan(
                                    text: getScore(document),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: getScoreColor(document)),
                                  )),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.red),
                                    color: Colors.white,
                                    onPressed: () {
                                      registerDownVote(document, _firebaseUser.uid, _databaseService);
                                    },
                                  )
                                ]),
                          )
                        ]),
                    title: document['titre'] != null
                        ?
                        document['resolu'] == true
                        ?
                        Row(
                            children: <Widget>[
                              Icon(Icons.check, color: Colors.green,),
                              Text("[Resolu] " + document['titre'].toString(),
                              style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0))
                      ]
                        ) : Row(
                            children: <Widget>[
                              Text(document['titre'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20.0))
                            ]
                        )
                        : const Text(''),
                    //trailing: const Icon(Icons.arrow_forward_rounded),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  String getScore(QueryDocumentSnapshot document) {
    List<dynamic> upVotes = List.from(document['upvotes'] as Iterable<dynamic>);
    List<dynamic> downvotes =
    List.from(document['downvotes'] as Iterable<dynamic>);
    int result = upVotes.length - downvotes.length;
    if (result > 0) return "+" + result.toString();
    return result.toString();
  }

  Color getScoreColor(QueryDocumentSnapshot document) {
    List<dynamic> upVotes = List.from(document['upvotes'] as Iterable<dynamic>);
    List<dynamic> downvotes =
    List.from(document['downvotes'] as Iterable<dynamic>);
    int result = upVotes.length - downvotes.length;
    if (result < 0) return Colors.red;
    if (result > 0) return Colors.green;
    return Colors.black54;
  }

  void registerUpVote(QueryDocumentSnapshot document, String userId, DatabaseService db){
    List<String> upVotes = List<String>.from(document['upvotes'] as List<dynamic>);
    List<String> downVotes = List<String>.from(document['downvotes'] as List<dynamic>);
    if(upVotes.contains(userId)){
      upVotes.remove(userId);
    }
    else{
      upVotes.add(userId);
      if(downVotes.contains(userId)){
        downVotes.remove(userId);
      }
    }

    db.firebaseFirestore.collection("Posts").doc(document.id).update({
      "upvotes": upVotes,
      "downvotes": downVotes
    });

  }

  void registerDownVote(QueryDocumentSnapshot document, String userId, DatabaseService db){
    List<String> upVotes = List<String>.from(document['upvotes'] as List<dynamic>);
    List<String> downVotes = List<String>.from(document['downvotes'] as List<dynamic>);
    if(downVotes.contains(userId)){
      downVotes.remove(userId);
    }
    else{
      downVotes.add(userId);
      if(upVotes.contains(userId)){
        upVotes.remove(userId);
      }
    }

    db.firebaseFirestore.collection("Posts").doc(document.id).update({
      "upvotes": upVotes,
      "downvotes": downVotes
    });

  }
}
