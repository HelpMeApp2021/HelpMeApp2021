import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_me_app/src/pages/problem_view_page/problem_view_page.dart';
import 'package:help_me_app/src/pages/problem_view_page/widgets/problem_view_body.dart';


class ProblemViewMain extends StatelessWidget {
  const ProblemViewMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProblemViewBody(
        )
      ],
    );
  }
}
