import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive/cubit/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(UserInitialState());

  // To add new product
  TextEditingController productNameController = TextEditingController();
  TextEditingController productImagePathController = TextEditingController();

  // User logic here...


}
