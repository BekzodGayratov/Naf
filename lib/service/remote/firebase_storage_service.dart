import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive/helpers/alert_widget.dart';

class FirebaseStorageService {
  static String uploadedFilePath = "";

  static Future<void> uploadFile(
    File file,
    String folderName,
  ) async {
    try {
      String fileName = basename(file.path);
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child("$folderName/$fileName")
          .putFile(file);
      uploadedFilePath = await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
