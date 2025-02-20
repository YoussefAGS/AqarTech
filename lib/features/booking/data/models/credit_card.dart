import 'package:json_annotation/json_annotation.dart';

part 'credit_card.g.dart';

@JsonSerializable()
class AddCreditCard {
  final String cardScheme;
  final String cardType;
  final String cardMask;
  final String cardToken;

  AddCreditCard(
      {required this.cardScheme, required this.cardType,required  this.cardMask,required  this.cardToken});

  factory AddCreditCard.fromJson(Map<String, dynamic> json) =>
      _$AddCreditCardFromJson(json);

  Map<String, dynamic> toJson() => _$AddCreditCardToJson(this);
}
