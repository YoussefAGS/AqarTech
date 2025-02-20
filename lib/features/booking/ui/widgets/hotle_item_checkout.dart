import 'package:aqartech/core/common/constants.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/features/booking/data/models/booking_date_response.dart';
import 'package:aqartech/features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/spacing.dart';
import '../../../../core/style/colors/colors.dart';
import '../../../../core/style/text_styles/text_styles.dart';

class HotelItemCheckout extends StatelessWidget {
  const HotelItemCheckout({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingDateCubit>();
    BookingDateResponse? hotelInfo= cubit.state.whenOrNull(
        success: (data) => data
    );
    return Container(
      height: 115.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: Colors.white,
            ),
      padding: EdgeInsets.all(10.sp),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          // child: Image(
          //   image: const AssetImage("assets/images/core/single_page.png"),
          //   height: 108.sp,
          //   width: 132.sp,
          //   fit: BoxFit.cover ,
          // ),
          child: CachedNetworkImage(
            imageUrl: hotelInfo?.booking?.localizedBookedApartment!.Apartment!.ApartmentImage ?? noImage,
            fit: BoxFit.cover,
              height: 108.sp,
                      width: 132.sp,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
        ),
        horizontalSpace(10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(hotelInfo?.booking?.localizedBookedApartment!.Apartment?.name??
                  context.translate(LangKeys.noName),
              style: TextStyles.font16Black500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(2),
            Text(
              // "${hotelItemSearch.address?.addressLine ?? ''},${hotelItemSearch.address?.city ?? ''}",
              "${hotelInfo?.booking?.localizedBookedApartment!.Apartment?.ApartmentAddress?.addressLine??'155 villa 5'},${hotelInfo?.booking?.localizedBookedApartment!.Apartment?.ApartmentAddress?.district?.name??"no name"}",
              style: TextStyles.font12Black400.copyWith(
                color: const Color(0xFF939393),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: "${context.translate(LangKeys.sar)} ${hotelInfo?.booking?.localizedBookedApartment!.Apartment?.nightlyPrice}/",
                          style: TextStyles.font14Black700.copyWith(
                            color: ColorsManager.mainColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                          children: [
                        TextSpan(
                          text: context.translate(LangKeys.night),
                          style: TextStyles.font12Black400
                              .copyWith(color: Colors.grey,
                            overflow: TextOverflow.ellipsis,
                  
                          ),
                        )
                      ])),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 15.sp,
                      color: Color(0xFFFFD33C),
                    ),
                    horizontalSpace(2),
                    Text(
                      "${hotelInfo?.booking?.localizedBookedApartment!.Apartment?.avgRating ?? "?.?"}",
                      style: TextStyles.font14Black400
                          .copyWith(color: Colors.yellow)
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "(${hotelInfo?.booking?.localizedBookedApartment!.Apartment?.reviewCount ?? "0"})",
                      style: TextStyles.font12Black400
                          .copyWith(color: Colors.grey)
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          ],
        ))
      ]),
    );
  }
}
