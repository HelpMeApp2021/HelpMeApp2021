import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'write_reply_body.dart';

class WriteReplyMain extends StatelessWidget {
  const WriteReplyMain({
    Key key,
    String documentId,
  })  : _documentId = documentId,
        super(key: key);

  final String _documentId;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Provider.value(
            value: _documentId, child: WriteReplyBody(documentId: _documentId))
      ],
    );
  }
}
