import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/app_text_form_field.dart';
import 'package:aqartech/core/utils/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/colors/colors.dart';
import '../../../../core/utils/widgets/logo_row_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool isHistory = true;
  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
    bool isTrue =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTrue ? 100.sp : 100.sp,
        flexibleSpace: FlexibleSpaceBar(
          // expandedTitleScale: isTrue ? 50.sp : 90.sp,
          background: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Favorites", style: TextStyles.font18Black700),
                verticalSpace(10.sp),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isHistory = true;  // ✅ Change the state directly
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 2.sp, top: 2.sp, bottom: 2.sp),
                            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: isHistory ? Colors.white : Colors.grey.shade300, // ✅ Fix Color Logic
                            ),
                            child: Center(
                              child: Text("apartments", style: TextStyles.font14Black400),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isHistory = false; // ✅ Change the state directly
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 2.sp, top: 2.sp, bottom: 2.sp),
                            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: isHistory ? Colors.grey.shade300 : Colors.white, // ✅ Fix Color Logic
                            ),
                            child: Center(
                              child: Text("services", style: TextStyles.font14Black400),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: ColorsManager.secondaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return isHistory ?PropertyCard(
            imageUrl:"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/49/a5/e0/sur-grand-hotel.jpg?w=1200&h=-1&s=1",
            title: "Villa 5 rooms has pool with free maintance",
            price: "1,500,000 AED/month",
            location: "Mogul , Discovery garden, Dubai",
            bathrooms: 2,
            bedrooms: 3,
            extraFeature: 1200,
            isService: null,
          ):PropertyCard(
            imageUrl:"https://scitexas.edu/wp-content/uploads/2023/03/mechanic-and-vehicle-technician.jpg",
            title: "Villa 5 rooms has pool with free maintance",
            price: "2,500,000 AED/month",
            location: "Mogul , Discovery garden, Dubai",
            isService: true,
          );
        },
      ),
    );
  }
}


class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;
  final String location;
  final bool? isService;
  final int? bedrooms;
  final int? bathrooms;
  final int? extraFeature;

  const PropertyCard({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.location,
    this.isService = false,
     this.bedrooms,
     this.bathrooms,
     this.extraFeature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.sp,
      margin: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 114.sp,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.sp),
                bottomLeft: Radius.circular(10.sp),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.no_photography)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(price, style: TextStyles.font14GrayRegular),
                  Text(title, style: TextStyles.font14Black500, maxLines: 2),
                  Text(location, style: TextStyles.font13black400),
                  if (isService==null )
                    Row(
                      children: [
                        ImageIcon(AssetImage("assets/features/bathtub.png"), size: 25.sp),
                        Text("${bathrooms ?? 0}", style: TextStyles.font13black400),
                        SizedBox(width: 5.sp),
                        ImageIcon(AssetImage("assets/features/bed.double.png"), size: 25.sp),
                        Text("${bedrooms ?? 0}", style: TextStyles.font13black400),
                        SizedBox(width: 5.sp),
                        ImageIcon(AssetImage("assets/features/m2.button.horizontal.png"), size: 25.sp),
                        Text("${extraFeature ?? 0}", style: TextStyles.font13black400),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
