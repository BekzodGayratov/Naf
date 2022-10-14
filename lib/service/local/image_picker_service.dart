import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:responsive/helpers/alert_widget.dart';

class ImagePickerService {
  static File? selectedImage;
  static XFile? image;
  static Future<void> selectImage(ImageSource source) async {
    try {
      image = await ImagePicker().pickImage(source: source);
      File? img = File(image!.path);
      selectedImage = img;
    } catch (e) {
      showNafAlert(e.toString());
    }
  }
}
