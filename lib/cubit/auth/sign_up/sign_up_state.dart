
import 'package:bloc/bloc.dart';

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
  SignUpErrorState();
}
