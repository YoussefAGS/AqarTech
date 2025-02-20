import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/utils/widgets/CircularImageWidget.dart';
import 'package:aqartech/features/villa_description/ui/refactor/villa_details_app_bar.dart';
import 'package:aqartech/features/villa_description/ui/widgets/update_profile_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/colors/colors.dart';
import '../../../../core/style/text_styles/text_styles.dart';

class villaDetailsBody extends StatelessWidget {
  villaDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            VillaDetailsAppBar(
              imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/49/a5/e0/sur-grand-hotel.jpg?w=1200&h=-1&s=1",

            ),
            SliverPadding(
              padding: EdgeInsets.all(10.sp),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Villa Details',
                                style: TextStyles.font16Black500),
                            verticalSpace(5),
                            RichText(
                                text: TextSpan(
                                    text: "2000 AED/",
                                    style: TextStyles.font15black500.copyWith(
                                        color: ColorsManager.mainColor,
                                        overflow: TextOverflow.ellipsis),
                                    children: [
                                      TextSpan(
                                          text: "Rent",
                                          style: TextStyles.font13BlueRegular
                                              .copyWith(color: Colors.grey))
                                    ])),
                            verticalSpace(5),
                            Text(
                              "Mogul , Discovery garden, Dubai",
                              style: TextStyles.font12blackRegular
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10.sp),

                          ),
                          child: Row(
                            children: [
                              Image(
                                image:
                                AssetImage("assets/features/location.png"),
                                width: 10.sp,
                                height: 10.sp,
                                color: ColorsManager.mainColor,
                              ),
                              Text(
                                "Live location",
                                style: TextStyles.font15black500
                                    .copyWith(color: ColorsManager.mainColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    verticalSpace(20),
                    Text(
                      "Rooms & Beds",
                      style: TextStyles.font16Black500,
                    ),
                    verticalSpace(10),
                    SizedBox(
                      height: 110.sp,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => horizontalSpace(5),
                        scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 110.sp,
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image:
                                    AssetImage("assets/features/bathtub.png"),
                                    height: 20.sp,
                                    width: 24.sp,
                                    color: Colors.black,
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    "Bathrooms",
                                    style: TextStyles.font15black500,
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    "2",
                                    style: TextStyles.font12blackRegular
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    verticalSpace(20),
                    Text(
                      "Features & Amenities",
                      style: TextStyles.font16Black500,
                    ),
                    verticalSpace(10),
                    SizedBox(
                      height: 110.sp,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => horizontalSpace(5),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 110.sp,

                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage("assets/features/sofa.png"),
                                    height: 24.sp,
                                    width: 24.sp,
                                    color: Colors.black,
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    "Furnished",
                                    style: TextStyles.font15black500,
                                  ),
                                  verticalSpace(10),
                                ],
                              ),
                            );
                          }),
                    ),

                    verticalSpace(20),
                    Text(
                      "Property information",
                      style: TextStyles.font16Black500,
                    ),
                    verticalSpace(10),
                    SizedBox(
                      height: 110.sp,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => horizontalSpace(5),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 110.sp,

                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image:
                                    AssetImage("assets/features/house.png"),
                                    height: 24.sp,
                                    width: 24.sp,
                                    color: Colors.black,
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    "Type",
                                    style: TextStyles.font12blackRegular
                                        .copyWith(color: Colors.grey),
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    "Apartment",
                                    style: TextStyles.font14Black400,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),

                    verticalSpace(30),
                    Text("About that property",style: TextStyles.font18Black700 ,),
                    verticalSpace(10),
                    Text(
                        style: TextStyles.font14Black400,

                        "**Stunning Luxury Apartment in Dubai** Discover your dream home in the heart of Dubai with this exquisite luxury apartment priced at AED 2,000,000. Located in a prestigious neighborhood, this property offers a perfect blend of modern elegance and comfort.**Key Features:****Spacious Layout:** Enjoy an open-concept living space with floor-to-ceiling windows that flood the apartment with natural light and provide breathtaking views of the city skyline.**High-End Finishes:** The apartment boasts top-quality finishes, including marble flooring, designer fixtures, and state-of-the-art appliances in the gourmet kitchen.**Amenities Galore:** Residents have access to a range of premium amenities, including a rooftop pool, fully-equipped gym, landscaped gardens, and 24/7 concierge service.**Prime Location:** Situated close to major attractions such as the Burj Khalifa, Dubai Mall, and a variety of fine dining options, you’ll experience the best of city living.**Secure Parking:** The property includes dedicated parking spaces for your convenience."),
                    verticalSpace(30),
                    ProfileItem(
                      imagePath: "assets/features/image (4).png",
                      label: "Infinity living Real estate ",
                      onPressed: () {
                        context.pushName(AppRoute.checkoutScreen) ;
                      },
                    ),

                    verticalSpace(10),

                    CallAndVisiteButtons()

                  ]


                        ,)),
            )
        ]),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onPressed; // Adding onPressed callback

  const ProfileItem({
    Key? key,
    required this.imagePath,
    required this.label,
    this.onPressed, // Optional callback parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Using GestureDetector to handle tap
      onTap: onPressed, // Executing the onPressed callback
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30.sp),
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Row(
          children: [
            Row(
              children: [
               CircularImageWidget(height: 40, imagePath: imagePath),
                SizedBox(width: 5.sp),
                // Using SizedBox instead of horizontalSpace for clarity
                Text(
                  label,
                  style: TextStyles.font16Black500,
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 19.sp,
              color: ColorsManager.gray,
            ),
          ],
        ),
      ),
    );
  }
}


