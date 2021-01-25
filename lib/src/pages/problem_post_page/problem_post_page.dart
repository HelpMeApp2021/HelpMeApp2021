import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/drawer/problem_post_drawer.dart';
import 'widgets/problem_post_main.dart';

class ProblemPostPage extends StatelessWidget {
  const ProblemPostPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2E4053),
        appBar: AppBar(
          backgroundColor: const Color(0xff2E4060),
          title: const Text('Poster un problème'),
        ),
        drawer: const ProblemPostDrawer(),
        body: const ProblemPostMain(),
      ),
    );
  }
}
