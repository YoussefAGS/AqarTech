import 'package:json_annotation/json_annotation.dart';

part 'booking_date_request.g.dart';

@JsonSerializable()
class BookingDateRequest {
  final String? checkInDate;
  final String? checkOutDate;

  BookingDateRequest(this.checkInDate, this.checkOutDate);

  factory BookingDateRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingDateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDateRequestToJson(this);
}
