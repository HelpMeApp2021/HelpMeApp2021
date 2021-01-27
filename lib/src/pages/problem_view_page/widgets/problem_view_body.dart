import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/firebase_services/database_service.dart';

class ProblemViewBody extends StatelessWidget {
  const ProblemViewBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    return StreamBuilder(
        stream: _databaseService
            .getDocument('Posts', context.watch<String>())
            .asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return StreamBuilder(
            stream: _databaseService
                .getDocumentWithDocumentReference(
                    snapshot.data['appareil'] as DocumentReference)
                .asStream(),
            builder: (context, appareil) {
              if (!appareil.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Text.rich(TextSpan(
                      text: 'Titre : ${snapshot.data['titre']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[350]),
                      children: [
                        TextSpan(
                          text: '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]),
                        )
                      ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Text.rich(TextSpan(
                      text:
                          'Référence appareil : ${appareil.data['reference']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[350]),
                      children: [
                        TextSpan(
                          text: '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]),
                        )
                      ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Text.rich(TextSpan(
                      text: 'Description : ${snapshot.data['description']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[350]),
                      children: [
                        TextSpan(
                          text: '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]),
                        )
                      ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          child: const Text(
                            'Réponses ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                            decoration: const BoxDecoration(),
                            child: Text('ffs')//listResponses(data),
                            )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
