import 'package:flutter/material.dart';

extension UniredSizeConfig on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get height => mq.size.height;
  double get width => mq.size.width;
}