import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomDialog extends StatelessWidget {
  //const CustomDialog({Key key}) : super(key: key);
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  CustomDialog(this.title, this.content, this.callback,
      [this.actionText = 'Reset']);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: [
        TextButton(
            onPressed: callback,
            child: Text(actionText),
        ),
      ],
    );
  }
}
