import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/show_loading.dart';
import 'package:aqartech/features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import 'package:aqartech/features/booking/logic/checkout_cubit/check_out_cubit.dart';
import 'package:aqartech/features/booking/ui/screens/booking_info_screen.dart';
import 'package:aqartech/features/booking/ui/screens/calender_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  final String id;

  const CheckoutScreen({super.key, required this.id});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int currentPage = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      BookingCalenderScreen(
        id: widget.id,
        ontab:(){
          setState(() {

          });
          currentPage = 1;
        } ,
      ),
      BookingInfo(
        onBackPress: () {
          currentPage = 0;
          setState(() {});
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<BookingDateCubit, BookingDateState>(
        buildWhen: (previce, currnt) =>
        currnt is LoadingGetUnAvailableDates ||
            currnt is unAvailableDatesSuccess ||
            currnt is FailureGetUnAvailableDates,
        listener: (context, state) {
          state.whenOrNull(loading: () {
            showLoading(context);
          },
            success: (data) {
              dismissLoading(context);
            currentPage = 1;
            setState(() {});
            context.read<CheckOutCubit>().bookingId = data.booking?.localizedBookedApartment?.bookingId??"";
            context.read<CheckOutCubit>().totalAmount = data.booking!.localizedBookedApartment!.totalPrice!;
          },
              failure: (error) {
                dismissLoading(context);
          },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(loadingGetUnAvailableDates: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }, unAvailableDatesSuccess: (data) {
            return pages[currentPage];
          }, failureGetUnAvailableDates: (error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<BookingDateCubit>()
                            .getUnAvailableDates(id: widget.id);
                      },
                      icon: Icon(Icons.refresh)),
                  verticalSpace(10),
                  Text(
                    error,
                    style: TextStyles.font14Black700,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }, orElse: () {
            return pages[currentPage];
          });
        },
      )
    );
  }
}
