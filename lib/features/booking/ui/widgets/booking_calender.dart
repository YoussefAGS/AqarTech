import 'package:aqartech/core/app/app_cubit/app_cubit.dart';
import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/style/colors/colors.dart';


class BookingCalender extends StatefulWidget {
  const BookingCalender({super.key});

  @override
  State<BookingCalender> createState() => _BookingCalenderState();
}

class _BookingCalenderState extends State<BookingCalender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStartDay;
  DateTime? _rangeEndDay;

  // Define the unavailable date ranges (modify as needed)
  List<Map<String, DateTime>> _unavailableRanges=[];


  @override
  void initState() {
    super.initState();
    _rangeStartDay = context.read<BookingDateCubit>().rangeStartDay;
    _rangeEndDay = context.read<BookingDateCubit>().rangeEndDay;
  }

  // Method to check if a day falls in an unavailable range
  bool isUnavailableDay(DateTime day) {
    for (var range in _unavailableRanges) {
      if (day.isAfter(range['start']!) && day.isBefore(range['end']!) ||
          day.isAtSameMomentAs(range['start']!) ||
          day.isAtSameMomentAs(range['end']!)||compareDates(day,range['start']!)||compareDates(day,range['end']!)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    _unavailableRanges= [];
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.translate(LangKeys.date), style: TextStyles.font20Black600),
                TextButton(
                  onPressed: () {
                    _rangeStartDay = null;
                    _rangeEndDay = null;
                    context.read<BookingDateCubit>().rangeStartDay = null;
                    context.read<BookingDateCubit>().rangeEndDay = null;
                    setState(() {});
                  },
                  child: Text(
                    context.translate(LangKeys.clearAll),
                    style: TextStyles.font15black700.copyWith(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            TableCalendar(
              locale: context.read<AppCubit>().currentLangCode,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              rangeStartDay: _rangeStartDay,
              rangeEndDay: _rangeEndDay,
              // Disable unavailable dates
              enabledDayPredicate: (day) => !isUnavailableDay(day),

              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  DateTime today = DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  );
                  DateTime selectedDate = DateTime(
                    selectedDay.year,
                    selectedDay.month,
                    selectedDay.day,
                  );
                  if (selectedDate.isBefore(today)) {
                    ShowToast.showToastErrorTop(
                        message: context.translate(LangKeys.pleaseSelectAValidDateAfterToday));
                  }

                  else if (_rangeStartDay == null ||
                      (_rangeStartDay != null && _rangeEndDay != null)) {
                    _rangeStartDay = selectedDay;
                    _rangeEndDay = null;
                  } else if (_rangeStartDay != null && _rangeEndDay == null) {
                    if (compareDates(_rangeStartDay!, selectedDay)) {
                      ShowToast.showToastWarningTop(
                          message: context.translate(LangKeys.youCantSelectTheSameDay));
                    } else if (_rangeStartDay != null &&
                        selectedDay == _rangeStartDay) {
                      _rangeStartDay = selectedDay;
                    } else if (selectedDay.isAfter(_rangeStartDay!)) {
                      _rangeEndDay = selectedDay;
                    } else {
                      _rangeEndDay = _rangeStartDay;
                      _rangeStartDay = selectedDay;
                    }
                  }
                  context.read<BookingDateCubit>().rangeStartDay =
                      _rangeStartDay;
                  context.read<BookingDateCubit>().rangeEndDay = _rangeEndDay;
                  _focusedDay = focusedDay;
                });
              },
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronVisible: true,
                rightChevronVisible: true,
                titleTextStyle: TextStyles.font14Black500,
                leftChevronIcon: Icon(Icons.chevron_left,
                    color: ColorsManager.mainColor, size: 15.sp),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: ColorsManager.mainColor,
                  size: 15.sp,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(
                  color: Colors.blue, // Change text color for weekends
                ),
              ),
              calendarStyle: CalendarStyle(
                disabledTextStyle: TextStyles.font18Black700.copyWith(
                  color: Colors.red, // Color for unavailable dates
                ),
                todayDecoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                rangeStartDecoration: const BoxDecoration(
                  color: ColorsManager.mainColor,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: ColorsManager.mainColor,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: Color(0xFF4F8F92).withOpacity(0.4),
                defaultTextStyle: TextStyles.font14Black500,
                weekendTextStyle: TextStyles.font14Black500,
              ),
            ),
            const Divider(),
            verticalSpace(10),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                _buildDateButton(context.translate(LangKeys.plus1Day), () {
                  addDays(1);
                }),
                _buildDateButton(context.translate(LangKeys.plus2Day), () {
                  addDays(2);
                }),
              ],
            ),
            verticalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10.sp,
                      child: SizedBox(height: 5.sp,),
                    ),
                    horizontalSpace(2),
                    Text(context.translate(LangKeys.daysWereBooked), style: TextStyles.font14Black400, textAlign: TextAlign.center,),
                  ],
                ),
                verticalSpace(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 10.sp,
                      child: SizedBox(height: 5.sp,),
                    ),
                    horizontalSpace(2),
                    Text(context.translate(LangKeys.availableDays), style: TextStyles.font14Black400, textAlign: TextAlign.center,),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton(String label, VoidCallback onPressed) {
    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.mainColor,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(label, style: TextStyles.font14Black400),
      ),
    );
  }
  void addDays(int numOfDays) {
    if (_rangeStartDay == null && _rangeEndDay == null) {
      ShowToast.showToastWarningTop(message: context.translate(LangKeys.pleaseSelectDateFirst));
    }
    if (_rangeEndDay != null) {
      setState(() {
        _rangeEndDay = _rangeEndDay!.add(Duration(days: numOfDays));
      });
    } else if (_rangeStartDay != null) {
      setState(() {
        _rangeEndDay = _rangeStartDay!.add(Duration(days: numOfDays));
      });
    }
  }

}

bool compareDates(DateTime date1, DateTime date2) {
  return date1.day == date2.day &&
      date1.month == date2.month &&
      date1.year == date2.year;
}
