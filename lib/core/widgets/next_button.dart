import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';

class NextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  const NextButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.06,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? NafTheme.itemColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
