import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Scaffold _scaffold(BuildContext context, SignInState state) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: _signInForm(context, state)),
        floatingActionButton: StandartPadding(
            child: NextButton(child: Text("Hello"), onPressed: () {})),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  Form _signInForm(BuildContext context, SignInState state) => Form(
        child: StandartPadding(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.05,
              ),
              Expanded(
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      hintText: "email".tr(),
                      controller: context.watch<SignInCubit>().emailController,
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    TextFormFieldWidget(
                        hintText: "password".tr(),
                        controller:
                            context.watch<SignInCubit>().passwordController)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
