import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/search_text_form_widget.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/cubit/home/home_state.dart';
import 'package:responsive/helpers/add_product_widget.dart';
import 'package:responsive/service/remote/firestore_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Widget _scaffold(BuildContext context, HomeState state) => Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(),
        body: _body(context),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showAddProductModelSheet(context);
        }),
      );

  Widget _body(BuildContext context) {
    return Column(
      children: [
        StandartPadding(
          child: SearchTextFormWidget(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xffCCCDD6),
            ),
            hintText: "search".tr(),
          ),
        ),
        SizedBox(
          height: context.height * 0.05,
        ),
        SizedBox(
          height: context.height * 0.4,
          child: SizedBox(
            height: context.height * 0.25,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    width: context.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
