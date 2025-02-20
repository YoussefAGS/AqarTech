import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/app_text_button.dart';
import 'package:aqartech/features/booking/data/models/booking_date_response.dart';
import 'package:aqartech/features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import 'package:aqartech/features/booking/logic/checkout_cubit/check_out_cubit.dart';
import 'package:aqartech/features/booking/ui/widgets/booking_card_ditals.dart';
import 'package:aqartech/features/booking/ui/widgets/hotle_item_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/simmer_loading.dart';
import '../../../../core/style/colors/colors.dart';
import '../../../../core/utils/widgets/custom_Sliver_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class BookingInfo extends StatelessWidget {
  final VoidCallback onBackPress;

  const BookingInfo({
    super.key,
    required this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckOutCubit>();
    // final savedCardCubit = context.read<SavedCardCubit>();
    // List<SavedCreditCared>? savedCards = savedCardCubit.state.whenOrNull(
    //     success: (data) => data
    // );
    final bookingCubit = context.watch<BookingDateCubit>();
    BookingDateResponse? hotelInfo= bookingCubit.state.whenOrNull(
        success: (data) => data
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title:context.translate(LangKeys.checkout),onBackPress: onBackPress,),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  // AddOnsCheckboxList(
                  //   allAddOns: hotelInfo!.booking!.localizedBookedApartment!.Apartment!.ApartmentAddOns ??[],
                  //   selectedAddOns: hotelInfo.booking!.localizedBookedApartment!.bookingAddons??[],
                  //   bookingId: hotelInfo.booking!.localizedBookedApartment?.bookingId.toString(),
                  // )
                  HotelItemCheckout(),
                  verticalSpace(20),
                  BookingDetailsCard()
                  // bookingCubit.state is LoadingAddService
                  //     ? ShimmerLoading(
                  //   height: 115.sp,
                  //   width: double.infinity,
                  //   borderRadius: 20.sp,
                  // )
                  //     : const HotelItemCheckout(),
                  // verticalSpace(20.sp),
                  // bookingCubit.state is LoadingAddService
                  //     ? ShimmerLoading(
                  //   height: 344.sp,
                  //   width: double.infinity,
                  //   borderRadius: 10.sp,
                  // )
                  //     : const ,

                  // Additional Widgets
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(text: "continue To Payment", onPressed: () {
                    context.pushName(AppRoute.fillInfoScreen,
                        arguments: cubit);
                    // context.pushName(AppRoute.homeScreen);
                    // context.read<LoginCubit>().emitLoginStates();
                  })
                  // AppTextButton(
                  //   backgroundColor: bookingCubit.state is BookingSuccess ? ColorsManager.mainColor: ColorsManager.gray,
                  //   buttonText: context.translate(LangKeys.continueToPayment),
                  //   textStyle: TextStyles.font16Black500.copyWith(
                  //       fontWeight: FontWeight.bold, color: Colors.white),
                  //   onPressed: bookingCubit.state is BookingSuccess?() {
                  //     context.pushName(AppRoute.fillInfoScreen,
                  //         arguments: cubit);
                  //   }:(){},
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// class AddOnsCheckboxList extends StatefulWidget {
//   final bookingId;
//   final List<BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns?> allAddOns;
//   final List<BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns?> selectedAddOns;
//
//   AddOnsCheckboxList({required this.allAddOns, required this.selectedAddOns, this.bookingId});
//
//   @override
//   _AddOnsCheckboxListState createState() => _AddOnsCheckboxListState();
// }
//
// class _AddOnsCheckboxListState extends State<AddOnsCheckboxList> {
//   late List<BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns> _selectedAddOns;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedAddOns = List.from(widget.selectedAddOns);
//   }
//
//   void _onCheckboxChanged(bool? value, BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns addOn) {
//     setState(() {
//       if (value == true) {
//         // _selectedAddOns.add(addOn);
//         context.read<BookingDateCubit>().addService(serviceId:addOn.id! , bookingId: widget.bookingId);
//       } else {
//         // _selectedAddOns.removeWhere((item) => item.id == addOn.id);
//         context.read<BookingDateCubit>().removeService(serviceId:addOn.id! , bookingId: widget.bookingId);
//
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.allAddOns.isEmpty
//         ? const SizedBox()
//         : Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: widget.allAddOns.map((addOn) {
//         final isChecked = _selectedAddOns.any((item) => item.id == addOn?.id);
//         return Container(
//           // padding: EdgeInsets.all(5.sp),
//           margin: EdgeInsets.only(bottom: 5.sp),
//           decoration: BoxDecoration(
//             color: ColorsManager.gray.withOpacity(0.6),
//             borderRadius: BorderRadius.circular(10.sp),
//             border: Border.all(
//               color: ColorsManager.mainColor,
//               width: 1.sp,
//             ),
//           ),
//           child: Row(
//             children: [
//               Checkbox(
//                 checkColor: Colors.white,
//                 activeColor: ColorsManager.mainColor,
//                 side: BorderSide(
//                   // color: Colors.white,
//                   width: 1.sp,
//                 ),
//                 value: isChecked,
//                 onChanged: (value) => _onCheckboxChanged(value, addOn!),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       addOn?.type ?? 'Unknown Add-On',
//                       style: TextStyles.font16Black500,
//                       // style: Theme.of(context).textTheme.bodyText1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     RichText(
//                         text: TextSpan(
//                             text:  "${addOn?.price ?? "?.?"} /",
//                             style: TextStyles.font14Black700.copyWith(
//                               color: ColorsManager.mainColor,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: context.translate(LangKeys.night),
//                                 style: TextStyles.font12Black400
//                                     .copyWith(color: ColorsManager.mainColor,
//                                   overflow: TextOverflow.ellipsis,
//
//                                 ),
//                               )
//                             ])),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
