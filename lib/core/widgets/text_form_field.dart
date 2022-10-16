import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String v)? onChanged;
  final EdgeInsets? contentPadding;
  final int? maxLine;

  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      this.textInputType,
      this.hintText,
      this.onChanged,
      this.contentPadding,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      cursorColor: NafTheme.itemColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Color(0xffCCCDD6),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none),
      ),
      onChanged: onChanged,
    );
  }
}
