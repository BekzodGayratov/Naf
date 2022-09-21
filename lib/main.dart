import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/cubit/auth/sign_in/sign_in_state.dart';
import 'package:responsive/cubit/home/user_cubit.dart';
import 'package:responsive/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await setDefaultLang();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => SignInCubit()),
      ],
      child: EasyLocalization(
          saveLocale: true,
          child: MyApp(),
          supportedLocales: const [
            Locale('uz'),
            Locale('en'),
          ],
          path: "lib/lang")));
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

setDefaultLang() async {
  if (GetStorage().read('lang') == null) {
    await GetStorage().write('lang', 'uz');
  }
}
