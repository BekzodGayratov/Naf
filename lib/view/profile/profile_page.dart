import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/head_one_text.dart';
import 'package:responsive/core/widgets/headline_three_text.dart';
import 'package:responsive/core/widgets/headline_two_text.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/helpers/image_picker_widget.dart';
import 'package:responsive/service/local/image_picker_service.dart';
import 'package:responsive/service/remote/edit_profile_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StandartScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineOneText(text: "myProfile".tr()),
            SizedBox(
              height: context.height * 0.02,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: context.height * 0.05),
                  width: double.infinity,
                  height: context.height * 0.23,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ImagePickerWidget())
                                .then((value) async {
                              await EditProfileService.uploadFile(
                                  ImagePickerService.selectedImage!);
                              EditProfileService.editProfilePicture();
                            });
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                FirebaseAuth.instance.currentUser!.photoURL !=
                                        null
                                    ? CachedNetworkImageProvider(FirebaseAuth
                                        .instance.currentUser!.photoURL!)
                                    : null,
                            child:
                                FirebaseAuth.instance.currentUser!.photoURL ==
                                        null
                                    ? Text(
                                        FirebaseAuth
                                            .instance.currentUser!.displayName
                                            .toString()[0],
                                        style: const TextStyle(fontSize: 30.0),
                                      )
                                    : null,
                          ),
                        ),
                      ),
                      Center(
                          child: HeadlineTwoText(
                              text: FirebaseAuth
                                  .instance.currentUser!.displayName
                                  .toString())),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
