// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class RequiredFieldsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Please fill in the correct email'),
      actions: [
        ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showRequiredFieldsDialog_email(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RequiredFieldsDialog();
    },
  );
}
