import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/widgets/headline_two_text.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Scaffold _scaffold(BuildContext context, SignInState state) => Scaffold(
        body: SafeArea(child: _signInForm(context, state)),
      );

  Form _signInForm(BuildContext context, SignInState state) => Form(
        child: StandartPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                hintText: "email".tr(),
                controller: context.watch<SignInCubit>().emailController,
              ),
            ],
          ),
        ),
      );
}
