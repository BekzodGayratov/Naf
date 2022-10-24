import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/loading_widget.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/auth/sign_up/sign_up_state.dart';
import 'package:responsive/helpers/alert_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscureText = false;
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
        backgroundColor: const Color(0xff5956E9),
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: _signInForm(context, state)),
      );

  Form _signInForm(BuildContext context, SignUpState state) => Form(
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
                            "signUp".tr(),
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: context.height * 0.05,
                          ),
                          TextFormFieldWidget(
                              maxLine: 1,
                              prefixIcon: Icon(
                                Icons.account_circle_outlined,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              labelText: "name".tr(),
                              hintText: "Abdulloh",
                              controller:
                                  context.watch<SignUpCubit>().nameController),
                          SizedBox(
                            height: context.height * 0.02,
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
                                  context.watch<SignUpCubit>().emailController),
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
                                context.watch<SignUpCubit>().passwordController,
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
                          SizedBox(
                            height: context.height * 0.04,
                          ),
                          NextButton(
                              backgroundColor: NafTheme.iconColor,
                              child: state is SignUpLoadingState
                                  ? const LoadingWidget()
                                  : Text(
                                      "signUp".tr(),
                                      style: const TextStyle(fontSize: 18.0),
                                    ),
                              onPressed: () {
                                context.read<SignUpCubit>().signUp();
                              }),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'sign_in');
                                },
                                child: Text("signIn".tr())),
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
