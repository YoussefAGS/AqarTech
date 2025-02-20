import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/style/colors/colors.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/CircularImageWidget.dart';
import 'package:aqartech/features/auth/ui/refactor/signup_body.dart';
import 'package:aqartech/features/home/logic/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/spacing.dart';
import '../../../../core/utils/widgets/custom_button_2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.sp,
            toolbarHeight: 5.sp,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    EdgeInsets.only(left: 16.0.w, right: 16.w, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/features/location.png"),
                          color: ColorsManager.mainColor,
                          size: 20.h,
                        ),
                        horizontalSpace(5),
                        Text(
                          "UAE",
                          style: TextStyles.font14Black400,
                        ),
                        Spacer(),
                        Image.asset(
                          "assets/features/bell.png",
                          height: 20.h,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: ColorsManager.gray,
                          ),
                          horizontalSpace(3),
                          Text(
                            "Search for your what you want",
                            style: TextStyles.font14Black500
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 10.h),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 171.w,
                                    padding: EdgeInsets.all(10.r),
                                    decoration: BoxDecoration(
                                      color: ColorsManager.pink,
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Recommend property",
                                          style: TextStyles.font14Black500,
                                        ),
                                        Row(children: [
                                          Expanded(
                                            child: Text(
                                              "Help us to reach to new providers",
                                              style: TextStyles.font12Black400,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                "assets/features/proberty.png"),
                                            height: 50.h,
                                          )
                                        ]),
                                        CustomButton2(
                                          onPressed: () {},
                                          text: "Started",
                                          color: ColorsManager.mainColor,
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    horizontalSpace(5),
                                itemCount: 5),
                          ),
                          verticalSpace(10),
                          Text(
                            "App category",
                            style: TextStyles.font16Black500,
                          ),
                          verticalSpace(10),
                          Row(
                            children: [
                              Expanded(
                                  child: Image(
                                image: AssetImage(
                                    "assets/features/Real estate.png"),
                                height: 80.h,
                              )),
                              Expanded(
                                  child: Image(
                                image: AssetImage(
                                    "assets/features/Real estate.png"),
                                height: 80.h,
                              )),
                              Expanded(
                                  child: Image(
                                image: AssetImage(
                                    "assets/features/Real estate.png"),
                                height: 80.h,
                              )),
                            ],
                          ),
                          verticalSpace(10),
                          Container(
                              height: 166.h,
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/features/card.png"),
                              )),
                              child: SizedBox.shrink()),
                          verticalSpace(10),
                          Text(
                            "Villa for purchasing",
                            style: TextStyles.font16Black500,
                          ),
                          verticalSpace(10),
                          SizedBox(
                            height: 230.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return VillaCard(
                                    imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/49/a5/e0/sur-grand-hotel.jpg?w=1200&h=-1&s=1",
                                    secondImagePath: "assets/features/image (4).png",
                                    price: "2,000,000 AED",
                                    villaName: "Villa 5 rooms",
                                    bedrooms: 2,
                                    bathrooms: 2,
                                    extraFeature: 2,
                                    companyName: "NAVAmaintenanceservice",
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    horizontalSpace(5),
                                itemCount: 5),
                          ),
                          verticalSpace(10),
                          Text(
                            "Villa for rent",
                            style: TextStyles.font16Black500,
                          ),
                          verticalSpace(10),
                          SizedBox(
                            height: 230.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return VillaCard(
                                    imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/49/a5/e0/sur-grand-hotel.jpg?w=1200&h=-1&s=1",
                                    secondImagePath: "assets/features/image (4).png",
                                    price: "2,000,000 AED",
                                    villaName: "Villa 5 rooms",
                                    bedrooms: 2,
                                    bathrooms: 2,
                                    extraFeature: 2,
                                    companyName: "NAVAmaintenanceservice",
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    horizontalSpace(5),
                                itemCount: 5),
                          ),
                          verticalSpace(10),
                          Text(
                            "Services for Subscribe",
                            style: TextStyles.font16Black500,
                          ),
                          verticalSpace(10),
                          SizedBox(
                            height: 230.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return VillaCard(
                                    imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/49/a5/e0/sur-grand-hotel.jpg?w=1200&h=-1&s=1",
                                    secondImagePath: "assets/features/image (4).png",
                                    price: "2,000,000 AED",
                                    villaName: "Villa 5 rooms",
                                    bedrooms: 2,
                                    bathrooms: 2,
                                    extraFeature: 2,
                                    companyName: "NAVAmaintenanceservice",
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    horizontalSpace(5),
                                itemCount: 5),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                //     initial: () {
                //   return SliverFillRemaining(
                //       child: Center(
                //     child: CircularProgressIndicator(),
                //   ));
                // },
                //     loading: () {
                //   return SliverFillRemaining(
                //       child: Center(
                //     child: CircularProgressIndicator(),
                //   ));
                // }, loaded: (topRated, mostVisited, reviews, offers, error) {
                //   return SliverPadding(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: 16.0.sp, vertical: 10.sp),
                //     sliver: SliverList(
                //       delegate: SliverChildListDelegate(
                //         [],
                //       ),
                //     ),
                //   );
                // }, error: (error) {
                //   return SliverFillRemaining(
                //     child: RefreshErrorWidget(onPressed: () {}, error: error),
                //   );
                // }
              );
            },
          ),
        ],
      ),
    );
  }
}
class VillaCard extends StatelessWidget {
  final String imageUrl;
  final String secondImagePath;
  final String price;
  final String villaName;
  final int bedrooms;
  final int bathrooms;
  final int extraFeature;
  final String companyName;

  const VillaCard({
    Key? key,
    required this.imageUrl,
    required this.secondImagePath,
    required this.price,
    required this.villaName,
    required this.bedrooms,
    required this.bathrooms,
    required this.extraFeature,
    required this.companyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushName(AppRoute.villaDetailsRoute,);
      },
      child: Container(
        width: 171.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0.r),
          color: Colors.grey.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              width: 171.w,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox.shrink(),
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/features/heart.png"),
                        color: Colors.white,
                        size: 15.h,
                      ),
                      onPressed: () {
                        // Add your functionality here
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: TextStyles.font14Black700,
                  ),
                  Text(
                    villaName,
                    style: TextStyles.font14Black500,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage("assets/features/bathtub.png"),
                        size: 25.sp,
                      ),
                      Text(
                        "$bathrooms",
                        style: TextStyles.font14Black400,
                      ),
                      SizedBox(width: 5.sp),
                      ImageIcon(
                        AssetImage("assets/features/bed.double.png"),
                        size: 25.sp,
                      ),
                      Text(
                        "$bedrooms",
                        style: TextStyles.font14Black400,
                      ),
                      SizedBox(width: 5.sp),
                      ImageIcon(
                        AssetImage("assets/features/m2.button.horizontal.png"),
                        size: 25.sp,
                      ),
                      Text(
                        "$extraFeature",
                        style: TextStyles.font14Black400,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  const Divider(color: Colors.grey),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      CircularImageWidget(
                        height: 25,
                        imagePath: secondImagePath,
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Text(
                          companyName,
                          style: TextStyles.font12blackRegular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
