import 'package:json_annotation/json_annotation.dart';

part 'credit_card_response.g.dart';

@JsonSerializable()
class CreditCardResponse {
  final String? id;
  final String? userId;
  final String? cardScheme;
  final String? cardType;
  final String? cardMask;
  final String? cardToken;
  final String? createdAt;
  final String? updatedAt;

  CreditCardResponse(this.id, this.userId, this.cardScheme, this.cardType,
      this.cardMask, this.cardToken, this.createdAt, this.updatedAt);

  factory CreditCardResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardResponseToJson(this);
}
