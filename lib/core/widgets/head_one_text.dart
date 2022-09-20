import 'package:flutter/material.dart';

class HeadlineOneText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const HeadlineOneText({super.key, required this.text, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
