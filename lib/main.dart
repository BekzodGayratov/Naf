import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';
import 'package:responsive/cubit/home/user_cubit.dart';
import 'package:responsive/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UserCubit()),
    BlocProvider(create: (context) => SignInCubit()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: NafTheme.them,
      initialRoute: 'splash',
      onGenerateRoute: RouterGenerator.router.onGenerate,
    );
  }
}
