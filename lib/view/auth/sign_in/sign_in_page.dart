import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';
import 'package:responsive/helpers/alert_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInErrorState) {
            showNafAlert(state.error);
          } else if (state is SignInCompleteState) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }
        },
        builder: (context, state) => _scaffold(context, state));
  }

  SafeArea _scaffold(BuildContext context, SignInState state) => SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff5956E9),
          body: _signInForm(context, state),
        ),
      );

  Form _signInForm(BuildContext context, SignInState state) => Form(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                    decoration: const BoxDecoration(color: Color(0xff5956E9)),
                    child: const Center(
                        child: StandartScreenPadding(
                      child: Text(
                        "Wellcome back",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70.0,
                            fontWeight: FontWeight.w600),
                      ),
                    )))),
            Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0))),
                  child: StandartScreenPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Login")],
                    ),
                  ),
                ))
          ],
        ),
      );
}
