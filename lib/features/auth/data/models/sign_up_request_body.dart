import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String email;
  final String password;
  final String fullName;
  final String userType;
  final String phoneNumber;
  final String phoneCountryCode;

  SignUpRequestBody(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.userType,
      required this.phoneNumber,
      required this.phoneCountryCode});

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
