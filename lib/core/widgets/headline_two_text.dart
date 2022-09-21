import 'package:flutter/material.dart';

class HeadlineTwoText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const HeadlineTwoText({super.key, required this.text, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
