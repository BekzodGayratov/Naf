import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive/cubit/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(UserInitialState());

  // Firestore
  final Stream<QuerySnapshot> productsStream = FirebaseFirestore.instance
      .collection('products')
      .orderBy('created_at')
      .snapshots();
}
