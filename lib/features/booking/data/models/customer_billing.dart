import 'package:json_annotation/json_annotation.dart';

part 'customer_billing.g.dart';

@JsonSerializable()
class CustomerBilling {
  @JsonKey(name: 'CustomerBillingInfo')
  final List<CustomerBillingCustomerBillingInfo?>? CustomerBillingInfo;

  CustomerBilling(this.CustomerBillingInfo);

  factory CustomerBilling.fromJson(Map<String, dynamic> json) =>
      _$CustomerBillingFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerBillingToJson(this);
}

@JsonSerializable()
class CustomerBillingCustomerBillingInfo {
  final String? id;
  final String? name;

  final String? userId;
  final String? email;
  final String? phoneNumber;
  final String? addressLine;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? createdAt;
  final String? updatedAt;

  CustomerBillingCustomerBillingInfo(
      this.id,
      this.userId,
      this.email,
      this.phoneNumber,
      this.addressLine,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.createdAt,
      this.updatedAt, this.name);

  factory CustomerBillingCustomerBillingInfo.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerBillingCustomerBillingInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerBillingCustomerBillingInfoToJson(this);
}
