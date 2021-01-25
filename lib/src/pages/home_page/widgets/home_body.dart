import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_services/database_service.dart';
import '../../problem_view_page/problem_view_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _databaseService.getCollectionSnapshots('Posts'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scrollbar(
            child: ListView(
              children: snapshot.data.docs.map((document) {
                return Card(
                  child: ListTile(
                    leading: CachedNetworkImage(
                      //On a pas d'images pour les posts pour le moment.
                      imageUrl: 'https://image.flaticon.com/icons/png/512/40/40031.png',
                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        if (document['description'] != null)
                          Text.rich(TextSpan(text: document['description'].toString(), style: const TextStyle(fontWeight: FontWeight.bold),)),
                        if (document['appareil'] != null)
                          Text.rich(TextSpan(text: document['appareil'].toString(), style: const TextStyle(fontWeight: FontWeight.bold),)),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                      ],
                    ),
                    title: document['titre'] != null ? Text(document['titre'].toString()) : const Text(''),
                    trailing: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text.rich(TextSpan(text : getScore(document), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color : getScoreColor(document)),)),
                                // TODO : Les iconbuttons ont une taille minimum de 48 pixels, et font planter le trailing.Il faudrait trouver une alternative.
                                // IconButton(
                                //   icon: const Icon(Icons.keyboard_arrow_up_outlined, color : Colors.green),
                                //   color: Colors.white,
                                //   onPressed: () {
                                //     //TODO : Action associée au upvote
                                //   },
                                // ),
                                // IconButton(
                                //   icon: const Icon(Icons.keyboard_arrow_down_outlined, color : Colors.red),
                                //   color: Colors.white,
                                //   onPressed: () {
                                //     //TODO : Action associée au downvote
                                //   },
                                // )
                              ]),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }



  String getScore(QueryDocumentSnapshot document){
    List<dynamic> upVotes = List.from(document['upvotes'] as Iterable<dynamic>);
    List<dynamic> downvotes = List.from(document['downvotes'] as Iterable<dynamic>);
    int result = upVotes.length - downvotes.length;
    if(result > 0)
      return "+"+result.toString();
    return result.toString();
  }

  Color getScoreColor(QueryDocumentSnapshot document){
    List<dynamic> upVotes = List.from(document['upvotes'] as Iterable<dynamic>);
    List<dynamic> downvotes = List.from(document['downvotes'] as Iterable<dynamic>);
    int result = upVotes.length - downvotes.length;
    if(result < 0)
      return Colors.red;
    if(result > 0)
      return Colors.green;
    return Colors.black54;
  }


}

