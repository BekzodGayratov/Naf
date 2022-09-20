import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/cubit/home/user_cubit.dart';
import 'package:responsive/cubit/home/user_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Widget _scaffold(BuildContext context, UserState state) => Scaffold(
        body: Center(
          child: Text(
            "Hello",
            style: const TextStyle(color: Colors.red, fontSize: 40.0),
          ),
        ),
      );
}
