import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/helpers/image_viewer_widget.dart';

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
              decoration: const BoxDecoration(color: NafTheme.iconColor),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  if (FirebaseAuth.instance.currentUser!.photoURL != null) {
                    showImageDialog(
                        context, FirebaseAuth.instance.currentUser!.photoURL!);
                  }
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: _user.currentUser!.photoURL != null
                      ? CachedNetworkImageProvider(_user.currentUser!.photoURL!)
                      : null,
                  child: _user.currentUser!.photoURL == null
                      ? Text(
                          _user.currentUser!.displayName.toString()[0],
                          style: const TextStyle(fontSize: 30.0),
                        )
                      : null,
                ),
              ),
              accountName: Text(
                  FirebaseAuth.instance.currentUser!.displayName ??
                      "fullName".tr()),
              accountEmail:
                  Text(FirebaseAuth.instance.currentUser!.email.toString())),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
            leading: const Icon(
              Icons.person_outline,
              color: NafTheme.iconColor,
            ),
            title: Text(
              "profile".tr(),
              style: const TextStyle(color: NafTheme.iconColor),
            ),
          ),
        ],
      ),
    );
  }
}
