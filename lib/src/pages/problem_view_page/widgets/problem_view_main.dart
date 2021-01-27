import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'problem_view_body.dart';

class ProblemViewMain extends StatelessWidget {
  const ProblemViewMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProblemViewBody(),

      ],
    );
  }
}
