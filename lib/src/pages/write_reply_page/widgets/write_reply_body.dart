import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_me_app/src/pages/problem_view_page/problem_view_page.dart';

import '../../../services/firebase_services/database_service.dart';

class WriteReplyBody extends StatelessWidget {
  const WriteReplyBody({
    Key key,
    String documentId,
  })  : _documentId = documentId,
        super(key: key);

  final String _documentId;

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    final nomReponse = TextEditingController();
    final texteReponse = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(
                child: Text(
              'Votre Nom :',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[350]),
            )),
            Expanded(
              child: TextFormField(
                controller: nomReponse,
                decoration: const InputDecoration(labelText: 'Votre Nom*'),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[350]),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entrez Votre Nom';
                  }
                  return null;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(
                child: Text(
              "Votre Réponse :",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[350]),
            )),
            Expanded(
              child: TextFormField(
                controller: texteReponse,
                decoration: const InputDecoration(labelText: 'Votre Réponse*'),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[350]),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entrez Votre Réponse';
                  }
                  return null;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
          ]),
          IconButton(
            icon: const Icon(Icons.post_add),
            iconSize: 50,
            color: Colors.white,
            onPressed: () {
              //Truc à faire à l'appui, c'est pas mon problème.
              _databaseService
                  .addReply(_documentId, nomReponse.text, texteReponse.text)
                  .then((docRef) => Navigator.push<ProblemViewPage>(
                      context,
                      MaterialPageRoute<ProblemViewPage>(
                          builder: (context) =>
                              ProblemViewPage(documentId: _documentId))));
            },
          )
        ],
      ),
    );
  }
}
