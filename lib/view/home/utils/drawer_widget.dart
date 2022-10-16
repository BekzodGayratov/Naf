import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final FirebaseAuth _user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: _user.currentUser!.photoURL != null
                    ? NetworkImage(_user.currentUser!.photoURL!)
                    : null,
                child: _user.currentUser!.photoURL == null
                    ? Text(_user.currentUser!.displayName.toString())
                    : null,
              ),
              accountName: Text(
                  FirebaseAuth.instance.currentUser!.displayName ??
                      "fullName".tr()),
              accountEmail:
                  Text(FirebaseAuth.instance.currentUser!.email.toString()))
        ],
      ),
    );
  }
}
