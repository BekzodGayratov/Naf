import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'sign_up_cubit.dart';

abstract class SignUpState {
  SignUpState();
}

class SignUpInitialState extends SignUpState {
  SignUpInitialState();
}

class SignUpLoadingState extends SignUpState {
  SignUpLoadingState();
}

class SignUpCompleteState extends SignUpState {
  SignUpCompleteState();
}

class SignUpErrorState extends SignUpState {
  String error;
  SignUpErrorState(this.error);
}
