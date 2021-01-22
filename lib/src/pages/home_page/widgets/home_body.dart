import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {

  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController titreProbleme = TextEditingController();
    final TextEditingController referenceAppareil = TextEditingController();
    final TextEditingController descriptionProbleme = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
          children: <Widget> [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Titre du problème :",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[350]
                        ),
                      )
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: titreProbleme,
                      decoration: InputDecoration(labelText: 'Titre du probleme*'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[350]
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Entrez un titre pour le problème';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Référence de l'appareil :",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[350]
                        ),
                      )
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: referenceAppareil,
                      decoration: InputDecoration(labelText: 'Référence de votre appareil*'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[350]
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Entrez un titre pour le problème';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Description du problème :",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[350]
                        ),
                      )
                  ),
                  Padding(padding: EdgeInsets.all(50.0)),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: descriptionProbleme,
                      decoration: InputDecoration(labelText: 'Description du probleme*'),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[350]
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Entrez une description pour votre problème';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(25.0)),
                ]
            ),
            IconButton(
              icon: Icon(Icons.post_add),
              iconSize: 50,
              color: Colors.white,
              onPressed: () {
                    //Truc à faire à l'appui, c'est pas mon problème.
              },
            )
          ],
      ),

    );
  }
}