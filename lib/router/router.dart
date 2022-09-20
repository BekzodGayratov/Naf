import 'package:flutter/material.dart';
import 'package:responsive/view/boarding/boarding_page.dart';
import 'package:responsive/view/home/home_page.dart';
import 'package:responsive/view/splash/splash_screen.dart';

class RouterGenerator {
  static final RouterGenerator _generator = RouterGenerator._init();
  static RouterGenerator get router => _generator;
  RouterGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigate(HomePage());
      case 'splash':
        return navigate(SplashScreen());
      case 'boarding':
        return navigate(BoardingPage());
    }
    return null;
  }

  navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
