import 'package:flutter/material.dart';
import 'package:responsive/helpers/image_picker_widget.dart';

showImagePickerDialog(BuildContext context){
  return showDialog(
                          context: context,
                          builder: (context) => const ImagePickerWidget(),
                        );
}