import 'package:json_annotation/json_annotation.dart';

part 'transaction_referance.g.dart';

@JsonSerializable()
class TransactionReferance {
  final String transactionRef;
  final String postalCode;
  final String city;
  final String country;
  final String state;
  final String addressLine;
  final String name;
  final String email;
  final String phoneNumber;

  TransactionReferance(
      {required this.transactionRef,
        required  this.postalCode,
        required  this.city,
        required  this.country,
        required  this.state,
        required  this.addressLine,
        required this.name,
        required  this.email,
        required this.phoneNumber});

  factory TransactionReferance.fromJson(Map<String, dynamic> json) =>
      _$TransactionReferanceFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionReferanceToJson(this);
}
