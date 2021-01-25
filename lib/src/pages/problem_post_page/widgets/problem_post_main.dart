import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'problem_post_body.dart';

class ProblemPostMain extends StatelessWidget {
  const ProblemPostMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProblemPostBody(),
      ],
    );
  }
}
