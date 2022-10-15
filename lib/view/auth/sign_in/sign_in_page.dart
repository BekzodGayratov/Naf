import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/headline_two_text.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';
import 'package:responsive/helpers/alert_widget.dart';
import 'package:responsive/helpers/loading_widget.dart';

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

  Scaffold _scaffold(BuildContext context, SignInState state) => Scaffold(
        body: SafeArea(child: _signInForm(context, state)),
        floatingActionButton: StandartPadding(
            child: NextButton(
                child: state is SignInLoadingState
                    ? const LoadingWidget()
                    : Text("signIn".tr()),
                onPressed: () {
                  context.read<SignInCubit>().signIn();
                })),
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
                flex: 6,
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
                            context.watch<SignInCubit>().passwordController),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "sign_up");
                        },
                        child: HeadlineTwoText(text: "signUp".tr())),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
