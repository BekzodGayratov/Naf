import 'package:flutter/material.dart';

class HeadlineTwoText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  const HeadlineTwoText({super.key, required this.text, this.textAlign,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
