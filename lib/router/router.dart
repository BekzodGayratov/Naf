import 'package:flutter/material.dart';
import 'package:responsive/view/auth/sign_in/sign_in_page.dart';
import 'package:responsive/view/auth/sign_up/sign_up_page.dart';
import 'package:responsive/view/home/home_page.dart';
import 'package:responsive/view/profile/profile_page.dart';
import 'package:responsive/view/splash/splash_screen.dart';

class RouterGenerator {
  static final RouterGenerator _generator = RouterGenerator._init();
  static RouterGenerator get router => _generator;
  RouterGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigate(const HomePage());
      case 'splash':
        return navigate(const SplashScreen());
      case 'sign_in':
        return navigate(const SignInPage());
      case 'sign_up':
        return navigate(const SignUpPage());
      case 'profile':
        return navigate(ProfilePage());
    }
    return null;
  }

  navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
