import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/helpers/image_picker_widget.dart';
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
          child: StandartScreenPadding(
            child: Form(
              key: context.watch<HomeCubit>().formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  TextFormFieldWidget(
                    hintText: "productName".tr(),
                    controller:
                        context.watch<HomeCubit>().productNameController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "notFilled".tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  TextFormFieldWidget(
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const ImagePickerWidget(imageCategoryPath: "products"),
                          );
                        },
                        icon: const Icon(
                          Icons.image,
                          color: NafTheme.iconColor,
                        )),
                    hintText: "productDesc".tr(),
                    controller:
                        context.watch<HomeCubit>().productDescController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "notFilled".tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  TextFormFieldWidget(
                    textInputType: TextInputType.number,
                    hintText: "productCost".tr(),
                    controller:
                        context.watch<HomeCubit>().productCostController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "notFilled".tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  NextButton(
                    backgroundColor: NafTheme.iconColor,
                    onPressed: () {
                      if (BlocProvider.of<HomeCubit>(context, listen: false)
                          .formKey
                          .currentState!
                          .validate()) {
                        FirestoreService.writeData(
                            productName: BlocProvider.of<HomeCubit>(context,
                                    listen: false)
                                .productNameController
                                .text,
                            productDesc: BlocProvider.of<HomeCubit>(context,
                                    listen: false)
                                .productDescController
                                .text,
                            productCost: BlocProvider.of<HomeCubit>(context,
                                    listen: false)
                                .productCostController
                                .text,
                            productImagePath:
                                FirebaseStorageService.uploadedFilePath);
                      }
                    },
                    child: Text(
                      "upload".tr(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
