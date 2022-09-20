import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/cubit/splash/splash.state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Scaffold _scaffold(BuildContext context, SplashState state) => Scaffold();
}
