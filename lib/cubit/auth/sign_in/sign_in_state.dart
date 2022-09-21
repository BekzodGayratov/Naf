
import 'package:bloc/bloc.dart';
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
  SignInErrorState();
}
