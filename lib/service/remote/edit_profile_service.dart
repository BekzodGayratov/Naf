import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive/helpers/alert_widget.dart';
import 'package:responsive/service/local/image_picker_service.dart';

import 'package:responsive/service/remote/firebase_storage_service.dart';

class EditProfileService {
  static void editProfilePicture() async {
    await FirebaseStorageService.uploadFile(
        ImagePickerService.selectedImage!, "profilePic");
    await FirebaseAuth.instance.currentUser!
        .updatePhotoURL(FirebaseStorageService.uploadedFilePath);
    showNafAlert("Profile pic successfully updated");
    return;
  }
}
