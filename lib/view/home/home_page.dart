import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/search_text_form_widget.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/cubit/home/user_cubit.dart';
import 'package:responsive/cubit/home/user_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Widget _scaffold(BuildContext context, UserState state) => Scaffold(
        drawer: Drawer(),
        appBar: AppBar(),
        body: StandartPadding(
          child: Column(
            children: [
              SearchTextFormWidget(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xffCCCDD6),
                ),
                hintText: "search".tr(),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.height * 0.01),
                child: Text(
                  "orderOnline".tr(),
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w500),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      );
}
