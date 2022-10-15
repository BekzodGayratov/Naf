import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive/helpers/alert_widget.dart';

class FirebaseStorageService {
  static String uploadedFilePath = "";
  static Future<void> uploadImage(File image, String folderName) async {
    try {
      String fileName = basename(image.path);
      final storageRef =
          FirebaseStorage.instance.ref().child("${folderName}images/$fileName");
      await storageRef.putFile(image);
      uploadedFilePath = storageRef.fullPath;
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
