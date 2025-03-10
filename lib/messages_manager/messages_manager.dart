import 'package:flutter/material.dart';

class MessagesManager {
  static void showSuccessDialog(BuildContext context,
      {String? title, String? desc}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ''),
          content: Text(desc ?? ''),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
