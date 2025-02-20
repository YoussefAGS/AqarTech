part of 'saved_card_cubit.dart';

@freezed
class SavedCardState with _$SavedCardState {
  const factory SavedCardState.initial() = _Initial;

  const factory SavedCardState.loading() = SavedCardLoading;

  const factory SavedCardState.success(
      {@Default([])  List<SavedCreditCared> data}) = SavedCardSuccess;

  const factory SavedCardState.failure({required String message}) = SavedCardFailure;
}
