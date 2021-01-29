import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_me_app/src/pages/write_reply_page/write_reply_page.dart';
import 'package:provider/provider.dart';

import 'widgets/problem_view_main.dart';

class ProblemViewPage extends StatelessWidget {
  const ProblemViewPage({
    @required String documentId,
    Key key,
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
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Répondre"),
        onPressed: () {
          Navigator.push<WriteReplyPage>(
              context,
              MaterialPageRoute<WriteReplyPage>(
                  builder: (context) =>
                      WriteReplyPage(documentId: _documentId)));
        },
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff2E4060),
        icon: const Icon(Icons.reply),
      ),
    );
  }
}
