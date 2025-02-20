import 'package:json_annotation/json_annotation.dart';

part 'saved_credit_cared.g.dart';

@JsonSerializable()
class SavedCreditCared {
  final String? id;
  final String? cardScheme;
  final String? cardType;
  final String? cardMask;
  final String? cardToken;

  SavedCreditCared(
      this.id, this.cardScheme, this.cardType, this.cardMask, this.cardToken);

  factory SavedCreditCared.fromJson(Map<String, dynamic> json) =>
      _$SavedCreditCaredFromJson(json);

  Map<String, dynamic> toJson() => _$SavedCreditCaredToJson(this);
}
