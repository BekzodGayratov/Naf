import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/search_text_form_widget.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/cubit/home/home_state.dart';
import 'package:responsive/view/home/utils/tabs_widget.dart';

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
      );

  StandartPadding _body(BuildContext context) {
    return StandartPadding(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SearchTextFormWidget(
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xffCCCDD6),
              ),
              hintText: "search".tr(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.01),
              child: Text(
                "orderOnline".tr(),
                style: const TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
            ),
          ),
          const Expanded(
              flex: 3,
              child: DefaultTabController(length: 3, child: TabsWidget())),
          Expanded(
            flex: 3,
            child: ListView.builder(itemBuilder: (context, index) {
            return Container();
          }))
        ],
      ),
    );
  }
}
