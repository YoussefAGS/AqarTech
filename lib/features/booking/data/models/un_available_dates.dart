import 'package:json_annotation/json_annotation.dart';

part 'un_available_dates.g.dart';

@JsonSerializable()
class UnAvailableDates {
  final String? start;
  final String? end;

  UnAvailableDates(this.start, this.end);

  factory UnAvailableDates.fromJson(Map<String, dynamic> json) =>
      _$UnAvailableDatesFromJson(json);

  Map<String, dynamic> toJson() => _$UnAvailableDatesToJson(this);
}
