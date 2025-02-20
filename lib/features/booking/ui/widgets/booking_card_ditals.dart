import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/features/booking/data/models/booking_date_response.dart';
import 'package:aqartech/features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<BookingDateCubit>();
    // BookingDateResponse? hotelInfo= cubit.state.whenOrNull(
    //     success: (data) => data
    // );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
        side: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.translate(LangKeys.yourBooking),
              style: TextStyles.font14Black700.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 8.0.sp),

            // Date and Location
            Row(
              children: [
                Icon(Icons.date_range_outlined,
                    size: 17.sp, color: Colors.grey),
                SizedBox(width: 8.0),
                Text( context.translate(LangKeys.date) ,
                    style: TextStyles.font16Black500
                        .copyWith(fontWeight: FontWeight.w600)),
                Spacer(),
                Text(
                  '2/5/2023 - 2/5/2023',
                  style: TextStyles.font16Black500
                      .copyWith(color: Colors.black.withOpacity(0.7)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
            SizedBox(height: 8.0.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 17.sp, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(context.translate(LangKeys.roomLocation),
                    style: TextStyles.font16Black500
                        .copyWith(fontWeight: FontWeight.w600)),
                horizontalSpace(5),
                Expanded(
                  child: Text(
                    "155 ,ville, dubai",

                    style: TextStyles.font16Black500.copyWith(
                      color:  Colors.black.withOpacity(0.7),
                    ),
                    overflow: TextOverflow.ellipsis,

                    maxLines: 2,
                  ),
                )
              ],
            ),
            Divider(
              height: 32.0.sp,
            ),
            // Price Details
            Text(context.translate(LangKeys.priceDetails),
                style: TextStyles.font14Black700.copyWith(color: Colors.grey)),
            SizedBox(height: 8.0.sp),
            _buildPriceRow( context.translate(LangKeys.nightPrice) , '${context.translate(LangKeys.sar)} price'),
            SizedBox(height: 8.0.sp),
            _buildPriceRow(context.translate(LangKeys.services), '${context.translate(LangKeys.sar)} addon'),
            SizedBox(height: 8.0.sp),
            _buildPriceRow(context.translate(LangKeys.vat), '${context.translate(LangKeys.sar)} vat'),
            // if(hotelInfo.booking!.localizedBookedApartment!.isOfferApplied!)SizedBox(height: 8.0.sp),
            // if(hotelInfo.booking!.localizedBookedApartment!.isOfferApplied!) _buildPriceRow(context.translate(LangKeys.totalPriceWithoutOffer), '${context.translate(LangKeys.sar)} price'),
            SizedBox(height: 8.0.sp),
            _buildPriceRow(context.translate(LangKeys.totalPrice), '${context.translate(LangKeys.sar)} total'),

          ],
        ),
      ),
    );
  }
  Widget _buildPriceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight:  FontWeight.w600 ,
              fontSize:  16.sp ,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              fontWeight:  FontWeight.w500 ,
              fontSize:  16.sp ,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
String formatDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  return DateFormat('dd/MM/yyyy').format(dateTime);
}