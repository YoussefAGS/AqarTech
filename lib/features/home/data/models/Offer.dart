import 'package:json_annotation/json_annotation.dart';

part 'Offer.g.dart';

@JsonSerializable()
class Offer {
  final String? title;
  final String? description;

  Offer(this.title, this.description);

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
