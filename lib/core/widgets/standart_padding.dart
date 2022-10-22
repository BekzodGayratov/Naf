import 'package:flutter/material.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';

class StandartScreenPadding extends StatelessWidget {
  final Widget child;
  const StandartScreenPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.height * 0.03),
      child: child,
    );
  }
}
