

import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VillaDetailsAppBar extends StatelessWidget {
  String imageUrl;

  VillaDetailsAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      leading: IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
        ),
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 20.sp,
          color: Colors.black,
        ),
        onPressed: (){
          context.pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {
            // Handle favorite button action
          },
        ),
      ],
    );
  }
}