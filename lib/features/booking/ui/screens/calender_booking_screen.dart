import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/app_text_button.dart';
import 'package:aqartech/core/utils/widgets/custom_button.dart';
import 'package:aqartech/features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import 'package:aqartech/features/booking/ui/widgets/booking_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/colors/colors.dart';
import '../../../../core/utils/widgets/custom_Sliver_app_bar.dart';

class BookingCalenderScreen extends StatelessWidget {

  final String id;
  final VoidCallback ontab;
  const BookingCalenderScreen({super.key, required this.id, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title:context.translate(LangKeys.date),),
          const SliverToBoxAdapter(
            child: BookingCalender(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(text: "Go to Checkout", onPressed: ontab)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
