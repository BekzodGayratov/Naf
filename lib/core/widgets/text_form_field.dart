import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function(String v)? onChanged;

  const TextFormFieldWidget(
      {super.key, required this.controller, this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      onChanged: onChanged,
    );
  }
}
