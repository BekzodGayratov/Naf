import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/loading_widget.dart';
import 'package:responsive/core/widgets/next_button.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/core/widgets/text_form_field.dart';
import 'package:responsive/cubit/addProduct/add_product_state.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget({super.key});

  @override
  State<AddProductWidget> createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  @override
  void initState() {
    context.read<AddProductCubit>().deavtiveFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StandartScreenPadding(
        child: BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductCompleteState) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      builder: (context, state) => _addField(context, state),
    ));
  }

  Form _addField(BuildContext context, AddProductState state) {
    return Form(
      key: context.watch<AddProductCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.02,
          ),
          TextFormFieldWidget(
            hintText: "productName".tr(),
            controller: context.watch<AddProductCubit>().productNameController,
            validator: (v) {
              if (v!.isEmpty) {
                return "notFilled".tr();
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          TextFormFieldWidget(
            maxLine: 8,
            suffixIcon: IconButton(
                onPressed: () {
                  context.read<AddProductCubit>().addProductImage(context);
                },
                icon: const Icon(
                  Icons.image,
                  color: NafTheme.iconColor,
                )),
            hintText: "productDesc".tr(),
            controller: context.watch<AddProductCubit>().productDescController,
            validator: (v) {
              if (v!.isEmpty) {
                return "notFilled".tr();
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          TextFormFieldWidget(
            textInputType: TextInputType.number,
            hintText: "productCost".tr(),
            controller: context.watch<AddProductCubit>().productCostController,
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
          Column(
            children: [
              NextButton(
                backgroundColor: NafTheme.iconColor,
                onPressed: () async {
                  if (BlocProvider.of<AddProductCubit>(context, listen: false)
                      .formKey
                      .currentState!
                      .validate()) {
                    await context
                        .read<AddProductCubit>()
                        .uploadImage()
                        .then((value) {
                      context.read<AddProductCubit>().writeData();
                    });
                  }
                },
                child: state is AddProductLoadingState
                    ? const LoadingWidget()
                    : Text(
                        "upload".tr(),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
