import 'package:flutter/material.dart';

class HeadlineThreeText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? textOverflow;
  const HeadlineThreeText(
      {super.key,
      required this.text,
      this.textAlign,
      this.maxLine,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine,
      text,
      style: Theme.of(context).textTheme.headline3,
      overflow: textOverflow,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
