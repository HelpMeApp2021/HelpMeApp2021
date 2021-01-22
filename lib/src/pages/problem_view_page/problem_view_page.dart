import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_me_app/src/pages/problem_view_page/widgets/problem_view_main.dart';



class ProblemViewPage extends StatelessWidget {
  const ProblemViewPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E4053),
      appBar: AppBar(
        backgroundColor: const Color(0xff2E4060),
        title: const Text('Problème'),
      ),
      body: ProblemViewMain(),
    );
  }
}
