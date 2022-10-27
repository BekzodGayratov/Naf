import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String v)? onChanged;
  final EdgeInsets? contentPadding;
  final int? maxLine;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final bool? obscureText;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.onTap,
    this.textInputType,
    this.hintText,
    this.onChanged,
    this.contentPadding,
    this.maxLine,
    this.validator,
    this.prefixIcon,
    this.labelText,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText ?? false,
      validator: validator,
      maxLines: maxLine,
      controller: controller,
      cursorColor: NafTheme.itemColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff868686)),
        suffixIcon: suffixIcon,
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
            borderSide: BorderSide(color: Theme.of(context).iconTheme.color!)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Theme.of(context).iconTheme.color!)),
      ),
      onChanged: onChanged,
    );
  }
}
