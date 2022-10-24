import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/loading_widget.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';
import 'package:responsive/helpers/alert_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscureText = false;
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
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xff5956E9),
          body: _signInForm(context, state),
        ),
      );

  Form _signInForm(BuildContext context, SignInState state) => Form(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    decoration: const BoxDecoration(color: Color(0xff5956E9)),
                    child: Center(
                        child: StandartScreenPadding(
                      child: Text(
                        "wellcome".tr(),
                        style: const TextStyle(
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
                      // color: Colors.redAccent,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0))),
                  child: StandartScreenPadding(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          Text(
                            "signIn".tr(),
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: context.height * 0.05,
                          ),
                          TextFormFieldWidget(
                              maxLine: 1,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              labelText: "email".tr(),
                              hintText: "abdulloh@gmail.com",
                              controller:
                                  context.watch<SignInCubit>().emailController),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          TextFormFieldWidget(
                            labelText: "password".tr(),
                            hintText: "********",
                            maxLine: 1,
                            obscureText: obscureText,
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            controller:
                                context.watch<SignInCubit>().passwordController,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: obscureText != true
                                    ? Icon(Icons.remove_red_eye_outlined,
                                        color:
                                            Theme.of(context).iconTheme.color)
                                    : const Icon(Icons.remove_red_eye_sharp,
                                        color: NafTheme.iconColor)),
                          ),
                          TextButton(
                              onPressed: () {
                                // Forgot password logic...
                              },
                              child: Text("forgotPass".tr())),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          NextButton(
                              backgroundColor: NafTheme.iconColor,
                              child: state is SignInLoadingState
                                  ? const LoadingWidget()
                                  : Text(
                                      "signIn".tr(),
                                      style: const TextStyle(fontSize: 18.0),
                                    ),
                              onPressed: () {
                                context.read<SignInCubit>().signIn();
                              }),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'sign_up');
                                },
                                child: Text("signUp".tr())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      );
}
