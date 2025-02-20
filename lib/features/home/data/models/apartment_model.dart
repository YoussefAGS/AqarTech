import 'package:json_annotation/json_annotation.dart';

part 'apartment_model.g.dart';

@JsonSerializable()
class ApartmentModel {
  final String? id;
  final int? visitedCount;
  final String? name;
  final int? nightlyPrice;
  @JsonKey(name: 'ApartmentAddress')
  final ApartmentModelApartmentAddress? apartmentAddress;
  @JsonKey(name: 'ApartmentImage')
  final String? apartmentImage;
  final double? avgRating;
  final int? reviewCount;
  late  bool? isWished;

  ApartmentModel(
      this.visitedCount,
      this.name,
      this.nightlyPrice,
      this.apartmentAddress,
      this.apartmentImage,
      this.avgRating,
      this.reviewCount, this.id, this.isWished);

  factory ApartmentModel.fromJson(Map<String, dynamic> json) =>
      _$ApartmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApartmentModelToJson(this);
}

@JsonSerializable()
class ApartmentModelApartmentAddress {
  @JsonKey(name: 'District')
  final ApartmentModelApartmentAddressDistrict? district;

  ApartmentModelApartmentAddress(this.district);

  factory ApartmentModelApartmentAddress.fromJson(Map<String, dynamic> json) =>
      _$ApartmentModelApartmentAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ApartmentModelApartmentAddressToJson(this);
}

@JsonSerializable()
class ApartmentModelApartmentAddressDistrict {
  final String? name;
  @JsonKey(name: 'City')
  final ApartmentModelApartmentAddressDistrictCity? city;

  ApartmentModelApartmentAddressDistrict(this.name, this.city);

  factory ApartmentModelApartmentAddressDistrict.fromJson(
          Map<String, dynamic> json) =>
      _$ApartmentModelApartmentAddressDistrictFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApartmentModelApartmentAddressDistrictToJson(this);
}

@JsonSerializable()
class ApartmentModelApartmentAddressDistrictCity {
  final String? name;

  ApartmentModelApartmentAddressDistrictCity(this.name);

  factory ApartmentModelApartmentAddressDistrictCity.fromJson(
          Map<String, dynamic> json) =>
      _$ApartmentModelApartmentAddressDistrictCityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApartmentModelApartmentAddressDistrictCityToJson(this);
}
