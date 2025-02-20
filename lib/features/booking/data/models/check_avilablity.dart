import 'package:json_annotation/json_annotation.dart';

part 'check_avilablity.g.dart';

@JsonSerializable()
class CheckAvilablity {
  final String? message;

  CheckAvilablity(this.message);

  factory CheckAvilablity.fromJson(Map<String, dynamic> json) =>
      _$CheckAvilablityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAvilablityToJson(this);
}
