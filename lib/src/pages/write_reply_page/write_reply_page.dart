import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/write_reply_main.dart';

class WriteReplyPage extends StatelessWidget {
  const WriteReplyPage({
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
        title: Text('Répondre au Problème: $_documentId'),
      ),
      body: Provider.value(
        value: _documentId,
        child: WriteReplyMain(documentId: _documentId),
      ),
    );
  }
}
