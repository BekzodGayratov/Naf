import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

showImageDialog(BuildContext context, String imageUrl) async {
  return showDialog(
      context: (context),
      builder: (context) {
        return Center(
          child: CircleAvatar(
            radius: 180,
            backgroundColor: Colors.white,
            backgroundImage: imageUrl.isNotEmpty
                ? CachedNetworkImageProvider(imageUrl)
                : null,
          ),
        );
      });
}
