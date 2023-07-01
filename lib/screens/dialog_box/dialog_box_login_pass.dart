// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RequiredFieldsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Please fill in the correct password'),
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

void showRequiredFieldsDialog_pass(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RequiredFieldsDialog();
    },
  );
}
