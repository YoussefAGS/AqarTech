import 'package:json_annotation/json_annotation.dart';

part 'contact_details.g.dart';

@JsonSerializable()
class ContactDetails {
  final String? phone;
  final String? email;

  ContactDetails({required this.phone,required this.email});

  factory ContactDetails.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsToJson(this);
}
