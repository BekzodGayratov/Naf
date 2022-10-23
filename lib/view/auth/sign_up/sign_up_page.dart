import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/loading_widget.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/auth/sign_up/sign_up_state.dart';
import 'package:responsive/helpers/alert_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpErrorState) {
            showNafAlert(state.error);
          } else if (state is SignUpCompleteState) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }
        },
        builder: (context, state) => _scaffold(context, state));
  }

  Scaffold _scaffold(BuildContext context, SignUpState state) => Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: _signInForm(context, state)),
        floatingActionButton: StandartScreenPadding(
            child: NextButton(
                child: state is SignUpLoadingState
                    ? const LoadingWidget()
                    : Text("signUp".tr()),
                onPressed: () {
                  context.read<SignUpCubit>().signUp();
                })),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  Form _signInForm(BuildContext context, SignUpState state) => Form(
        child: StandartScreenPadding(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.05,
              ),
              Expanded(
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      hintText: "name".tr(),
                      controller: context.watch<SignUpCubit>().nameController,
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    TextFormFieldWidget(
                      hintText: "email".tr(),
                      controller: context.watch<SignUpCubit>().emailController,
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    TextFormFieldWidget(
                        hintText: "password".tr(),
                        controller:
                            context.watch<SignUpCubit>().passwordController)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
