import 'package:json_annotation/json_annotation.dart';

part 'update_customer_billing.g.dart';

@JsonSerializable()
class UpdateCustomerBilling {
  final String name;
  final String email;
  final String phoneNumber;
  final String addressLine;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  UpdateCustomerBilling(
      {required this.email,required this.name,
      required this.phoneNumber,
      required this.addressLine,
      required this.city,
      required this.state,
      required this.postalCode, required this.country});

  factory UpdateCustomerBilling.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerBillingFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerBillingToJson(this);
}
