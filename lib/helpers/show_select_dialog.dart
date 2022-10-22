import 'package:flutter/material.dart';

showSelectLangDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select language"),
          content: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Uzbek")),
              ElevatedButton(onPressed: () {}, child: Text("English")),
            ],
          ),
        );
      });
}
