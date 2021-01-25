import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProblemPostDrawerMenu extends StatelessWidget {
  ProblemPostDrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RaisedButton.icon(
          onPressed: () {
            //Navigator.push<ListPublicTourPage>(context, MaterialPageRoute<ListPublicTourPage>(builder: (context) => const ListPublicTourPage()));
          },
          icon: const Icon(Icons.directions_walk),
          label: const Text('Menu Item 1', style: TextStyle(fontSize: 17)),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          shape: const RoundedRectangleBorder(),
        ),
      ],
    );
  }
}
