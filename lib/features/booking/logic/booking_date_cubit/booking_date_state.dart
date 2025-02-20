part of 'booking_date_cubit.dart';

@freezed
class BookingDateState with _$BookingDateState {
  const factory BookingDateState.initial() = BookingInitial;
  const factory BookingDateState.loading() = BookingLoading;
  const factory BookingDateState.loadingGetUnAvailableDates() = LoadingGetUnAvailableDates;
  const factory BookingDateState.loadingAddService() = LoadingAddService;

  const factory BookingDateState.success(BookingDateResponse bookingDateRespons) = BookingSuccess;
  const factory BookingDateState.unAvailableDatesSuccess(List<UnAvailableDates> date) = unAvailableDatesSuccess;

  const factory BookingDateState.failure({required String error}) = BookingFailure;
  const factory BookingDateState.failureGetUnAvailableDates({required String error}) = FailureGetUnAvailableDates;


}
