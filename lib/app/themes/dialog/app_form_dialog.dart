import 'package:flutter/material.dart';

void showDialogWithFields(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      var alasanTEC = TextEditingController();
      return AlertDialog(
        title: const Text('Contact Us'),
        content: ListView(
          shrinkWrap: true,
          children: [
            TextFormField(
              controller: alasanTEC,
              decoration: const InputDecoration(hintText: 'Message'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Send'),
          ),
        ],
      );
    },
  );
}
