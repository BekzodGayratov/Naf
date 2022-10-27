import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive/core/constants/theme.dart';
import 'package:responsive/core/extensions/media_query_ext.dart';
import 'package:responsive/core/widgets/standart_padding.dart';

class InfoPage extends StatelessWidget {
  final Map<String, dynamic> details;
  const InfoPage({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              expandedHeight: context.height * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.yellowAccent,
                  child: PageView.builder(itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: details['image'],
                      fit: BoxFit.fill,
                    );
                  }),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                width: double.infinity,
                height: context.height * 0.62,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: StandartScreenPadding(
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.022,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          details['name'],
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.height * 0.05,
                            bottom: context.height * 0.03),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            details['about'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "\$ ${details['cost']}",
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: NafTheme.iconColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
