import 'package:aqartech/core/style/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/spacing.dart';
import '../../../../core/style/text_styles/text_styles.dart';
import '../../../../core/utils/widgets/CircularImageWidget.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title: Text(
          "Setting",
          style: TextStyles.font18Black700,
        ),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h) ,
          child: Column(
            children: [
              ProfileAppBar(
                ImagePath: "",
                name: "No Name",
                bio:  "No Bio",
                location: "No Location",
                profileImage: "assets/core/manger.png",
              ),
              verticalSpace(10),
              ProfileItem(
                imagePath: "assets/core/account.png",
                label: "Account",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),

              ProfileItem(
                imagePath: "assets/core/myservices.png",
                label: "My Services",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),

              ProfileItem(
                imagePath: "assets/core/creditcard.and.123.png",
                label: "My Credit Card",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),

              ProfileItem(
                imagePath: "assets/core/about.png",
                label: "About Aqar tech",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),

              ProfileItem(
                imagePath: "assets/core/peivcy.png",
                label: "Privacy ",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),

              ProfileItem(
                imagePath: "assets/core/help.png",
                label: "Help , Support",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),


              ProfileItem(
                imagePath: "assets/core/deletAccount.png",
                label: "Delete Account",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
              verticalSpace(10),

              ProfileItem(
                imagePath: "assets/core/logout.png",
                label: "Logout",
                onPressed: () {
                  print("Languages tapped!");
                  // You can navigate to another screen or perform other actions here
                },
              ),
            ],
          ),
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
        decoration: BoxDecoration(
          color: ColorsManager.background,
          borderRadius: BorderRadius.circular(10.r),
        ) ,
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 5.w),
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
              size: 19.h,
              color: ColorsManager.black,
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileAppBar extends StatelessWidget {
  final String name;
  final String bio;
  final String location;
  final String profileImage;
  final String ImagePath;

  const ProfileAppBar({
    Key? key,
    required this.name,
    required this.bio,
    required this.location,
    required this.profileImage,
    required this.ImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = this.ImagePath;
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(20.r),
      ) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              CircularImageWidget(
                height: 64,
                imagePath: "assets/features/person.png",
                // isNetworkImage: true,
              ),
              // BlocConsumer<UploadImageCubit, UploadImageState>(
              //   listener: (context, state) {
              //     state.maybeWhen(
              //         orElse: () {},
              //         success: (image) {
              //           imagePath = image;
              //         },
              //         error: (error) {
              //           ShowToast.showToastErrorTop(message:error );
              //         }
              //     );
              //   },
              //   builder: (context, state) {
              //     return state.maybeWhen(orElse: () {
              //       return InkWell(
              //         onTap: (){
              //           context.read<UploadImageCubit>().uploadImage();
              //         },
              //         child: CircularImageWidget(
              //           height: 88,
              //           imagePath: imagePath,
              //           isNetworkImage: true,
              //         ),
              //       );
              //     }, loading: () {
              //       return CircularProgressIndicator(
              //         color: Color(0xffD1BAFD),
              //       );
              //     });
              //   },
              // ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ahmed sayed",
                        style: TextStyles.font17blackMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text("Aqar tech@ gmail.com",
                        style: TextStyles.font12Black400.copyWith(
                          color: Color(0xffBCC2C0),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    verticalSpace(4),
                    Text("View profile",style: TextStyles.font16white600.copyWith(
                      color: ColorsManager.mainColor
                    ),)
                    // Wrap(
                    //   spacing: 8.sp,
                    //   runSpacing: 5,
                    //   alignment: WrapAlignment.start,
                    //   children: languages.map((lang) {
                    //     return Container(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: 10.sp, vertical: 5.sp),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(16.sp),
                    //         border: Border.all(
                    //           color: Color(0xffD1BAFD),
                    //         ),
                    //       ),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Text(
                    //             lang!.name!,
                    //             style: TextStyle(
                    //                 color: Color(0xffD1BAFD),
                    //                 fontSize: 11.sp,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //           horizontalSpace(5),
                    //           Image.asset(
                    //             "assets/core/${lang.name!}.png",
                    //             height: 12.sp,
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
