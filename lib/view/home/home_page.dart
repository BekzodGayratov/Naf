import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/search_text_form_widget.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/cubit/home/home_state.dart';
import 'package:responsive/helpers/alert_widget.dart';
import 'package:responsive/service/remote/firebase_storage_service.dart';
import 'package:responsive/service/remote/firestore_service.dart';
import 'package:responsive/view/addProduct/add_product_page.dart';
import 'package:responsive/view/cart/cart_page.dart';
import 'package:responsive/view/favorites/favorites_page.dart';
import 'package:responsive/view/home/utils/drawer_widget.dart';
import 'package:responsive/view/main/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [MainPage(), AddProductWidget()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Widget _scaffold(BuildContext context, HomeState state) => Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: DrawerWidget(),
        appBar: AppBar(
          toolbarHeight: context.height * 0.08,
          title: SearchTextFormWidget(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xffCCCDD6),
            ),
            hintText: "search".tr(),
          ),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            elevation: 0,
            selectedItemColor: NafTheme.iconColor,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.transparent,
            onTap: (v) {
              setState(() {
                _currentIndex = v.toInt();
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sell_outlined), label: ""),
            ]),
      );
}
