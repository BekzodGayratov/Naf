import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive/helpers/alert_widget.dart';

class FirebaseStorageService {
  static Future<void> uploadImage(File image) async {
    try {
      String fileName = basename(image.path);
      final storageRef = FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = storageRef.putFile(image);
      await uploadTask.whenComplete(
        () => showNafAlert("Picture uploaded"),
      );
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
