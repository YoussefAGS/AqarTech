part of 'check_out_cubit.dart';

@freezed
class CheckOutState with _$CheckOutState {
  const factory CheckOutState.initial() = _Initial;

  const factory CheckOutState.loading() = CheckOutLoading;

  const factory CheckOutState.customerBillingSuccess(CustomerBilling customerBilling  ) = CustomerBillingSuccess;

  const factory CheckOutState.success() = CheckOutSuccess;

  const factory CheckOutState.failure({required String message}) = CheckOutFailure;
}
