import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/cubit/addProduct/add_product_state.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';
import 'package:responsive/cubit/auth/sign_up/sign_up_state.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/cubit/profile/profile_state.dart';
import 'package:responsive/router/router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => AddProductCubit()),
        BlocProvider(create: (context) => ProfileCubit())
      ],
      child: EasyLocalization(
          saveLocale: true,
          supportedLocales: const [
            Locale('uz'),
            Locale('en'),
          ],
          path: "lib/lang",
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: NafTheme.them,
      initialRoute: 'splash',
      onGenerateRoute: RouterGenerator.router.onGenerate,
    );
  }
}
