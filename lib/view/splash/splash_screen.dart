import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff5956E9), Color(0xff5956E9)])),
          child: StandartScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.04,
                ),
                const Expanded(
                  flex: 4,
                  child: Text(
                    "Find your gadget",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Image.asset(
                      "assets/splash.png",
                      fit: BoxFit.fitHeight,
                    )),
                SizedBox(
                  height: context.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: context.height * 0.07,
        child: StandartScreenPadding(
          child: NextButton(
            onPressed: () {
              checkUser(context);
            },
            backgroundColor: Colors.white,
            child: Text(
              "start".tr(),
              style: const TextStyle(color: NafTheme.iconColor),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void checkUser(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "sign_in", (route) => false);
      }
    });
  }
}
