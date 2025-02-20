import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../routes/app_route.dart';

class PageUnderBuildScreen extends StatelessWidget {
  const PageUnderBuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          context.pushName(AppRoute.hotelInfoScreen, arguments: "cm1pfbjts0000uj0ynb91jdjj");
        },
        child: Center(
          child: Text("Under build"),
        ),
      ),
    );
  }
}
