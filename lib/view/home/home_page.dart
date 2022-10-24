import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/search_text_form_widget.dart';
import 'package:responsive/core/widgets/standart_padding.dart';
import 'package:responsive/cubit/home/home_cubit.dart';
import 'package:responsive/cubit/home/home_state.dart';
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
        body: _body(context),
      );

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.05,
        ),
        SizedBox(
          height: context.height * 0.38,
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

                List<Map<String, dynamic>> data = [];
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  data.add(document.data() as Map<String, dynamic>);
                }).toList();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: context.height * 0.06,
                                  left: context.width * 0.03,
                                  right: context.width * 0.03),
                              height: context.height * 0.3,
                              width: 200,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 3.0,
                                        offset: Offset(0.0, 0.0),
                                        color: Color(0xffE8E8E8))
                                  ],
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          ],
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: data[index]['image'] != null
                                  ? CachedNetworkImageProvider(
                                      data[index]['image'])
                                  : null,
                            ))
                      ],
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              }),
        )
      ],
    );
  }
}
