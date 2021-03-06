import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_me_app/src/pages/problem_post_page/problem_post_page.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RaisedButton.icon(
          onPressed: () {
            Navigator.push<ProblemPostPage>(
                context,
                MaterialPageRoute<ProblemPostPage>(
                    builder: (context) => const ProblemPostPage()));
          },
          icon: const Icon(Icons.post_add),
          label:
              const Text('Poster un problème', style: TextStyle(fontSize: 17)),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          shape: const RoundedRectangleBorder(),
        ),
      ],
    );
  }
}
