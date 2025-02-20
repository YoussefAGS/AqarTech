import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressed;


  CustomAppBar({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTrue = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;

    return AppBar(
      toolbarHeight: isTrue ? 50.sp : 50.sp,
      flexibleSpace: FlexibleSpaceBar(
        // expandedTitleScale: isTrue ? 50.sp : 90.sp,
        background: Column(
          children: [
            if (!isTrue) SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: Color(0xFF281f33),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                    onPressed: onPressed ?? () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: ColorsManager.secondaryColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      foregroundColor: ColorsManager.secondaryColor,
      surfaceTintColor: ColorsManager.secondaryColor ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.sp);
}
