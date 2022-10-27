import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/cubit/home/home_cubit.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
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
                  return Center(child: Text("serverErr".tr()));
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
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: context.height * 0.15,
                                  ),
                                  Text(
                                    data[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: context.height * 0.01,
                                        bottom: context.height * 0.02),
                                    child: Text(
                                      data[index]['about'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff868686)),
                                    ),
                                  ),
                                  Text(
                                    "\$ ${data[index]['cost']}",
                                    style: const TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff5956E9)),
                                  )
                                ],
                              ),
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
                              child: (data[index]['image'] == null ||
                                      data[index]['image'].toString().isEmpty)
                                  ? Image.asset(
                                      "assets/product/noImage.jpg",
                                      fit: BoxFit.cover,
                                    )
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
