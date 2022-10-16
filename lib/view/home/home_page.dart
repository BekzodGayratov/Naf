import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/search_text_form_widget.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/cubit/home/home_state.dart';
import 'package:responsive/helpers/add_product_widget.dart';
import 'package:responsive/view/home/utils/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => _scaffold(context, state));
  }

  Widget _scaffold(BuildContext context, HomeState state) => Scaffold(
        drawer: DrawerWidget(),
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
            child: StreamBuilder<QuerySnapshot>(
                stream: context.watch<HomeCubit>().productsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: context.width * 0.05),
                        width: context.width * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25.0),
                            image: DecorationImage(
                                image: NetworkImage(data['image']),
                                fit: BoxFit.fill)),
                      );
                    }).toList(),
                  );
                }),
          ),
        )
      ],
    );
  }
}
