import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/widgets/loading_widget.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/service/local/image_picker_service.dart';
import 'package:responsive/service/remote/firebase_storage_service.dart';

class ImagePickerWidget extends StatefulWidget {
  final String imageCategoryPath;
  const ImagePickerWidget({Key? key, required this.imageCategoryPath})
      : super(key: key);

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
            : NextButton(
                backgroundColor: NafTheme.iconColor,
                onPressed: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Center(child: LoadingWidget()),
                        );
                      });

                  await FirebaseStorageService.uploadFile(
                      ImagePickerService.selectedImage!,
                      widget.imageCategoryPath);
                  Future.delayed(Duration.zero).then((value) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
                child: Text("ok".tr()),
              )
      ],
    );
  }

  @override
  void dispose() {
    ImagePickerService.selectedImage = null;
    super.dispose();
  }
}
