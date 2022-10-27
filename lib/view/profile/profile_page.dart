import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/head_one_text.dart';
import 'package:responsive/core/widgets/headline_two_text.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/profile/profile_state.dart';
import 'package:responsive/helpers/alert_widget.dart';
import 'package:responsive/helpers/image_picker_widget.dart';
import 'package:responsive/service/local/image_picker_service.dart';
import 'package:responsive/service/remote/edit_profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isTapped = false;
  bool isEng = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Scaffold _scaffold(BuildContext context, ProfileState state) {
    return Scaffold(
      appBar: AppBar(),
      body: StandartScreenPadding(
        child: SingleChildScrollView(
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
                              child: FirebaseAuth
                                          .instance.currentUser!.photoURL ==
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
                        SizedBox(
                          height: context.height * 0.01,
                        ),
                        Center(
                            child: HeadlineTwoText(
                                text: FirebaseAuth
                                    .instance.currentUser!.displayName
                                    .toString())),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: TextFormFieldWidget(
                    maxLine: 1,
                    controller: context.watch<ProfileCubit>().nameController,
                    onChanged: (v) {
                      setState(() {
                        _isTapped = true;
                      });
                    },
                    suffixIcon: IconButton(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          context.read<ProfileCubit>().updateName();
                          setState(() {
                            _isTapped = false;
                          });
                        },
                        icon: _isTapped == true
                            ? const Icon(Icons.check)
                            : const SizedBox()),
                  )),
              SizedBox(
                height: context.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0)),
                child: ExpansionTile(
                  iconColor: NafTheme.iconColor,
                  textColor: NafTheme.iconColor,
                  title: Text(
                    "changeLang".tr(),
                  ),
                  children: [
                    CheckboxListTile(
                        title: const Text("Uzbek"),
                        value:
                            context.locale == const Locale('uz') ? true : false,
                        onChanged: (v) async {
                          await context.setLocale(const Locale('uz'));
                        }),
                    CheckboxListTile(
                        title: const Text("English"),
                        value:
                            context.locale == const Locale('en') ? true : false,
                        onChanged: (v) async {
                          await context.setLocale(const Locale('en'));
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        showNafAlert(context.locale.toString());
      }),
    );
  }
}
