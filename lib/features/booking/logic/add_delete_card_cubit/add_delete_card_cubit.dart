import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/features/booking/data/models/credit_card.dart';
import 'package:aqartech/features/booking/data/repo/booking_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_delete_card_state.dart';

part 'add_delete_card_cubit.freezed.dart';

class AddDeleteCardCubit extends Cubit<AddDeleteCardState> {
  BookingRepo bookingRepo;

  AddDeleteCardCubit(this.bookingRepo)
      : super(const AddDeleteCardState.initial());

  void deleteCard() async {
    emit(const AddDeleteCardState.loading());
    final result = await bookingRepo.deleteCard();
    if (isClosed) return;

    result.when(
        success: (data) {
          ShowToast.showToastSuccessTop(message: "Card Deleted successfully");
          emit(const AddDeleteCardState.success());
        },
        failure: (error) {
          ShowToast.showToastWarningTop(message: "Something went wrong when deleting the card");

          emit(const AddDeleteCardState.failure());
        });
  }

  void saveCreditCard({required AddCreditCard creditCard}) async {
    emit(const AddDeleteCardState.loading());
    final result = await bookingRepo.saveCreditCard(creditCard: creditCard);
    if (isClosed) return;
    result.when(success: (data) {
      ShowToast.showToastSuccessTop(message: "Card Saved successfully");
      emit(const AddDeleteCardState.success());
    }, failure: (error) {
      ShowToast.showToastWarningTop(message: "Can't Save Card");

      emit(const AddDeleteCardState.failure());
    });
  }
}
