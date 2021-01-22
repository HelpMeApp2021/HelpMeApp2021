import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_me_app/src/pages/problem_view_page/widgets/problem_view_main.dart';
import 'package:provider/provider.dart';

class ProblemViewPage extends StatelessWidget {
  const ProblemViewPage({
    Key key,
    String documentId,
  })  : _documentId = documentId,
        super(key: key);

  final String _documentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E4053),
      appBar: AppBar(
        backgroundColor: const Color(0xff2E4060),
        title: const Text('Problème'),
      ),
      body: Provider.value(
        value: _documentId,
        child: const ProblemViewMain(),
      ),
    );
  }
}
