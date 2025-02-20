import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "user")
  final LoginResponseUserResponse? userResponse;
  final String? token;

  LoginResponse(this.userResponse, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResponseUserResponse {
  final String? userId;
  final String? email;
  final String? fullName;
  final String? userType;

  LoginResponseUserResponse(
      this.userId, this.email, this.fullName, this.userType);

  factory LoginResponseUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseUserResponseToJson(this);
}
