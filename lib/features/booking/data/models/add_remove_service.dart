import 'package:json_annotation/json_annotation.dart';

part 'add_remove_service.g.dart';

@JsonSerializable()
class AddRemoveService {
  final String addOnId;

  AddRemoveService(this.addOnId);

  factory AddRemoveService.fromJson(Map<String, dynamic> json) =>
      _$AddRemoveServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AddRemoveServiceToJson(this);
}
