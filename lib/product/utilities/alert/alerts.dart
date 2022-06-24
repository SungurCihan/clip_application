import 'package:flutter/material.dart';

class Alerts {
  static showAlertDialog(BuildContext context, String title, String content) {
    // set up the button
    Widget okButton = TextButton(
        child: const Text("OK"), onPressed: () => Navigator.of(context).pop());

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
