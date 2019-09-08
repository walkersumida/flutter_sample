import 'package:flutter/material.dart';

class CustomDialog {
  void show(context, title) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              title: Text(title),
              children: <Widget>[
                SimpleDialogOption(
                    onPressed: () => Navigator.pop(context),
                ),
              ],
          );
        },
    );
  }
}
