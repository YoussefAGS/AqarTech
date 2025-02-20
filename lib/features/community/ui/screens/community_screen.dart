import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/style/colors/colors.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/logo_row_widget.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Community',
          style: TextStyles.font18Black700,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: LogoRowWidget(
                        textStyle: TextStyles.font15black500,
                        text: 'Osama ahmed ',
                        imagePath: "assets/core/person.png",
                        imageHeight: 50,
                      ),
                    ),
                    Text(
                      '9:00 pm',
                      style: TextStyles.font13BlueRegular
                          .copyWith(color: Colors.grey),
                    )
                  ],
                ),
                verticalSpace(10),
                Text(
                  "Solving problem",
                  style: TextStyles.font18Black700,
                ),
                verticalSpace(10),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Neque mi suspendisse tincidunt ultrices eget dignissim. Scelerisque lacus aliquam tellus id sit at at iaculis pulvinar. Egestas eget dolor tortor at. Sed amet diam fusce leo volutpat quis sollicitudin",
                  style: TextStyles.font13black400,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushName(AppRoute.addPostScreen);
          // Add your action here
        },
        backgroundColor: ColorsManager.mainColor,
        // Adjust color to match the image
        shape: const CircleBorder(),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}
