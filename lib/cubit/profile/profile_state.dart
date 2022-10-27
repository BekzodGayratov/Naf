import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'profile_cubit.dart';

abstract class ProfileState {
  ProfileState();
}

class ProfileInitialState extends ProfileState {
  ProfileInitialState();
}

class ProfileLoadingState extends ProfileState {
  ProfileLoadingState();
}

class ProfileCompleteState extends ProfileState {
  ProfileCompleteState();
}

class ProfileErrorState extends ProfileState {
  ProfileErrorState();
}
