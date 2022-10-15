import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/service/local/image_picker_service.dart';
import 'package:responsive/service/remote/firebase_storage_service.dart';
import 'package:responsive/service/remote/firestore_service.dart';

showAddProductModelSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              color: NafTheme.backgroundColor),
          child: StandartPadding(
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.05,
                ),
                TextFormFieldWidget(
                    hintText: "productName".tr(),
                    controller:
                        context.watch<HomeCubit>().productNameController),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const _ImagePickerWidget(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.upload_file_outlined),
                        Text("productImage".tr())
                      ],
                    ))
              ],
            ),
          ),
        );
      });
}

class _ImagePickerWidget extends StatefulWidget {
  const _ImagePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<_ImagePickerWidget> {
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
                  uploadData();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload_file_outlined),
                    Text("upload".tr()),
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

  void uploadData() async {
    await FirebaseStorageService.uploadImage(
        ImagePickerService.selectedImage!, "products");
    await FirestoreService.writeData(
        productName:
            // ignore: use_build_context_synchronously
            BlocProvider.of<HomeCubit>(context, listen: false)
                .productNameController
                .text,
        productImagePath: FirebaseStorageService.uploadedFilePath);
  }
}
