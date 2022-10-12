import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';

class SearchTextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String v)? onChanged;
  final Widget? prefixIcon;

  const SearchTextFormWidget(
      {super.key,
      this.prefixIcon,
      this.controller,
      this.textInputType,
      this.hintText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: NafTheme.itemColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Color(0xffCCCDD6)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(
              color: Color(0xffD3D3D3),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(
              color: Color(0xffD3D3D3),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(
              color: Color(0xffD3D3D3),
            )),
      ),
      onChanged: onChanged,
    );
  }
}
