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

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text.rich(TextSpan(
                  text: 'Titre : ${snapshot.data['titre']}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[50]),
                  children: [
                    TextSpan(
                      text: '...',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[50]),
                    )
                  ])),
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text.rich(TextSpan(
                  text: 'Référence appareil : ${snapshot.data['reference']}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[50]),
                  children: [
                    TextSpan(
                      text: '...',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[50]),
                    )
                  ])),
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text.rich(TextSpan(
                  text: 'Description : ${snapshot.data['description']}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[50]),
                  children: [
                    TextSpan(
                      text: '...',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[50]),
                    )
                  ])),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Center(
                child: Container(
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
              ),
            ],
          );
        });
  }
}
