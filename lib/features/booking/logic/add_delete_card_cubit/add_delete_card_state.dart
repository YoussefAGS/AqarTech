part of 'add_delete_card_cubit.dart';

@freezed
class AddDeleteCardState with _$AddDeleteCardState {
  const factory AddDeleteCardState.initial() = AddDeleteInitial;

  const factory AddDeleteCardState.loading() = AddDeleteLoading;

  const factory AddDeleteCardState.success() = AddDeleteSuccess;

  const factory AddDeleteCardState.failure() = AddDeleteFailure;
}
