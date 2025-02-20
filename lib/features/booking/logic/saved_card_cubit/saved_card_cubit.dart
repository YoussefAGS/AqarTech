import 'package:aqartech/core/common/constants.dart';
import 'package:aqartech/features/booking/data/models/saved_credit_cared.dart';
import 'package:aqartech/features/booking/data/repo/booking_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_card_state.dart';

part 'saved_card_cubit.freezed.dart';

class SavedCardCubit extends Cubit<SavedCardState> {
  BookingRepo bookingRepo;

  SavedCreditCared? selectedCard;
  bool isHasError = false;

  SavedCardCubit(this.bookingRepo) : super(const SavedCardState.initial());
  void getSavedCards() async {
    if (!isLoggedInUser) {
      emit(SavedCardState.success(data: []));
      return;
    }
    emit(const SavedCardState.loading());
    final result = await bookingRepo.getCreditCards();
    if (isClosed) return;
    result.when(
      success: (data) {
        if (data.isNotEmpty) {
          selectedCard = data.first;
        }
        emit(SavedCardState.success(data: data));
      },
      failure: (message) {

        isHasError = true;
        emit(SavedCardState.failure(message: message.apiErrorModel.message!));
      },
    );
  }
}
