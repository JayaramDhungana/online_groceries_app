import 'package:flutter/material.dart';

Future accountShowDialogWidget({
  required BuildContext context,
  required String title,
  required String detail,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Center(child: Text(title)),

        children: [
          SimpleDialogOption(child: Text(detail)),
          Center(
            child: SimpleDialogOption(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Exit"),
              ),
            ),
          ),
        ],
      );
    },
  );
}
