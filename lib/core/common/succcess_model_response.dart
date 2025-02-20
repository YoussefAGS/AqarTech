import 'package:json_annotation/json_annotation.dart';

part 'succcess_model_response.g.dart';

@JsonSerializable()
class SuccessModelResponse {
  final String? message;

  SuccessModelResponse(this.message);

  factory SuccessModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessModelResponseToJson(this);
}
