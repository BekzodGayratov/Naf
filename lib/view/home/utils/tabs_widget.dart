import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/cubit/home/home_cubit.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    context.watch<HomeCubit>().tabController =
        TabController(length: 3, vsync: this);
    return TabBar(
        controller: context.watch<HomeCubit>().tabController,
        isScrollable: true,
        indicatorColor: NafTheme.iconColor,
        labelColor: NafTheme.iconColor,
        tabs: [
          Tab(
              icon: Text(
            "computers".tr(),
            style: const TextStyle(
                color: Color(0xff5856E9),
                fontWeight: FontWeight.w600,
                fontSize: 16.0),
          )),
          Tab(
              icon: Text(
            "smartphones".tr(),
            style: const TextStyle(
                color: Color(0xff5856E9),
                fontWeight: FontWeight.w600,
                fontSize: 16.0),
          )),
          Tab(
              icon: Text(
            "monitors".tr(),
            style: const TextStyle(
                color: Color(0xff5856E9),
                fontWeight: FontWeight.w600,
                fontSize: 16.0),
          )),
        ]);
  }
}
