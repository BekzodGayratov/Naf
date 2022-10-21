import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/service/local/image_picker_service.dart';
import 'package:responsive/service/remote/firebase_storage_service.dart';
import 'package:responsive/service/remote/firestore_service.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  bool isUploaded = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("selectImage".tr()),
      content: ImagePickerService.selectedImage != null
          ? Image.file(ImagePickerService.selectedImage!)
          : const SizedBox(),
      actions: [
        !isUploaded
            ? Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await ImagePickerService.selectImage(
                            ImagePickerService.camera);
                        setState(() {
                          isUploaded = true;
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.camera_alt_outlined),
                          Text("selectFromCamera".tr()),
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () async {
                        await ImagePickerService.selectImage(
                            ImagePickerService.gallery);
                        setState(() {
                          isUploaded = true;
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.image),
                          Text("selectFromGallery".tr()),
                        ],
                      ))
                ],
              )
            : ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseStorageService.uploadFile(
                      ImagePickerService.selectedImage!, "products");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload_file_outlined),
                    Text("ok".tr()),
                  ],
                )),
      ],
    );
  }

  @override
  void dispose() {
    ImagePickerService.selectedImage = null;
    super.dispose();
  }
}
