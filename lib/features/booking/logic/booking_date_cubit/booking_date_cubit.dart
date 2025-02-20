import 'package:aqartech/core/common/constants.dart';
import 'package:aqartech/core/common/shared_pref_helper.dart';
import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/features/booking/data/models/booking_date_request.dart';
import 'package:aqartech/features/booking/data/models/booking_date_response.dart';
import 'package:aqartech/features/booking/data/models/un_available_dates.dart';
import 'package:aqartech/features/booking/data/repo/booking_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_date_state.dart';

part 'booking_date_cubit.freezed.dart';

class BookingDateCubit extends Cubit<BookingDateState> {
  final BookingRepo _bookingRepo;

  BookingDateCubit(this._bookingRepo) : super(const BookingDateState.initial());
  DateTime? rangeStartDay;
  DateTime? rangeEndDay;
  List<Map<String, DateTime>> unavailableRanges=[];
  Future<void> bookADate({required String id}) async {
    if (rangeStartDay == null) {
      ShowToast.showToastErrorTop(message: "Please select start day");
      return;
    } else if (rangeEndDay == null) {
      ShowToast.showToastErrorTop(message: "Please select end day");
    }
    String checkInDate =
        "${rangeStartDay!.year}-${rangeStartDay!.month}-${rangeStartDay!.day}";
    String checkOutDate =
        "${rangeEndDay!.year}-${rangeEndDay!.month}-${rangeEndDay!.day}";

    emit(const BookingDateState.loading());
    if (isClosed) return;
    String lang = await SharedPrefHelper.getString(SharedPrefKeys.language)??"en";

    final result = await _bookingRepo.bookADate(
        bookingDateRequest: BookingDateRequest(checkInDate, checkOutDate),
        id: id,lang:lang);
    if (isClosed) return;
    result.when(success: (bookingDateRespons) {
      emit(BookingDateState.success(bookingDateRespons));
    }, failure: (message) {
      ShowToast.showToastErrorTop(message: message.apiErrorModel.message!);
      emit(BookingDateState.failure(error:message.apiErrorModel.message!));
    });
  }
  void getUnAvailableDates({required String id}) async {
    emit(const BookingDateState.loadingGetUnAvailableDates());
    final result = await _bookingRepo.getUnAvailableDates(id: id);
    if (isClosed) return;
    result.when(success: (data) {
      unavailableRanges=convertToDateTimeRanges(data);
      print(data);
      emit(BookingDateState.unAvailableDatesSuccess(data));
    }, failure: (message) {
      emit(BookingDateState.failureGetUnAvailableDates(error:message.apiErrorModel.message!));
    });
  }
  List<Map<String, DateTime>> convertToDateTimeRanges(List<UnAvailableDates> dateRanges) {
    return dateRanges.map((range) {
      return {
        'start': DateTime.parse(range.start!).toUtc(),
        'end': DateTime.parse(range.end!).toUtc(),
      };
    }).toList();
  }


  void addService({required String serviceId,required String bookingId}) async {
    final bookingState = state;
    BookingDateResponse bookingDateResponse = BookingDateResponse(null, null); // Replace with a meaningful default.
    if (bookingState is BookingSuccess) {
      bookingDateResponse = bookingState.bookingDateRespons;
    }
    emit(const BookingDateState.loadingAddService());
    String lang = await SharedPrefHelper.getString(SharedPrefKeys.language) ?? "en";
    final result = await _bookingRepo.addBookingServices(serviceId: serviceId, bookingId: bookingId, lang: lang);
    if (isClosed) return;
    result.when(success: (successModelResponse) {
      emit(BookingDateState.success(successModelResponse));
      // ShowToast.showToastSuccessTop(message: successModelResponse.message);
    }, failure: (message) {
      ShowToast.showToastErrorTop(message: message.apiErrorModel.message!);
      emit(BookingDateState.success(bookingDateResponse));
    });
  }
  void removeService({required String serviceId, required String bookingId}) async {
    final bookingState = state;
     BookingDateResponse bookingDateResponse = BookingDateResponse(null, null); // Replace with a meaningful default.
    if (bookingState is BookingSuccess) {
      bookingDateResponse = bookingState.bookingDateRespons;
    }
    emit(const BookingDateState.loadingAddService());
    String lang = await SharedPrefHelper.getString(SharedPrefKeys.language) ?? "en";
    final result = await _bookingRepo.removeBookingServices(serviceId: serviceId, bookingId: bookingId, lang: lang);
    if (isClosed) return;
    result.when(success: (successModelResponse) {
      emit(BookingDateState.success(successModelResponse));
      // ShowToast.showToastSuccessTop(message: successModelResponse.message);
    }, failure: (message) {
      ShowToast.showToastErrorTop(message: message.apiErrorModel.message!);
      emit(BookingDateState.success(bookingDateResponse));
    });
  }
}
