import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProblemViewBody extends StatelessWidget {
  const ProblemViewBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        Text.rich(TextSpan(
            text: 'Titre : ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[50]),
            children: [
              TextSpan(
                text: '...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey[50]),
              )
            ])),
        const Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        Text.rich(TextSpan(
            text: 'Référence appareil : ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[50]),
            children: [
              TextSpan(
                text: '...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey[50]),
              )
            ])),
        const Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        Text.rich(TextSpan(
            text: 'Description : ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[50]),
            children: [
              TextSpan(
                text: "...",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey[50]),
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ],


    );
  }
}
