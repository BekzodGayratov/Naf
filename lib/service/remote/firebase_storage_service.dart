import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive/helpers/alert_widget.dart';

class FirebaseStorageService {
  static String uploadedFilePath = "";

  static Future<void> uploadFile(File file, String folderName) async {
    try {
      String fileName = basename(file.path);
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child("images/$folderName/$fileName")
          .putFile(file);
      uploadedFilePath = await snapshot.ref.getDownloadURL();

      //await storageRef.putFile(image);
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }

  static Future<void> deleteFile(String filePath) async {
    final storageRef = FirebaseStorage.instance.ref();
    final deleteFileRef = storageRef.child(filePath);
    print(filePath);

    try {
      // await deleteFileRef.delete();
      // showNafAlert("Successfully deleted");
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
