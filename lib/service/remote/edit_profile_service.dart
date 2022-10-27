import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive/helpers/alert_widget.dart';
import 'package:path/path.dart';

class EditProfileService {
  static void editProfilePicture() async {
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(uploadedFilePath);
    showNafAlert("Profile pic successfully updated");
    return;
  }

  static String uploadedFilePath = "";
  static Future<void> uploadFile(
    File file,
    //String folderName,
  ) async {
    try {
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child("users/${FirebaseAuth.instance.currentUser!.uid}/image")
          .putFile(file);
      uploadedFilePath = await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
