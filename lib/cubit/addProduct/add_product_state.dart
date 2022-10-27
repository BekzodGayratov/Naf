
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/helpers/image_picker_widget.dart';
import 'package:responsive/service/remote/firebase_storage_service.dart';
import 'package:responsive/service/remote/firestore_service.dart';

part 'add_product_cubit.dart';

abstract class AddProductState {
  AddProductState();
}

class AddProductInitialState extends AddProductState {
  AddProductInitialState();
}

class AddProductLoadingState extends AddProductState {
  AddProductLoadingState();
}

class AddProductCompleteState extends AddProductState {
  AddProductCompleteState();
}

class AddProductErrorState extends AddProductState {
  String error;
  AddProductErrorState(this.error);
}
