import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sign_in_cubit.dart';

abstract class SignInState {
  SignInState();
}

class SignInInitialState extends SignInState {
  SignInInitialState();
}

class SignInLoadingState extends SignInState {
  SignInLoadingState();
}

class SignInCompleteState extends SignInState {
  SignInCompleteState();
}

class SignInErrorState extends SignInState {
  String error;
  SignInErrorState(this.error);
}
