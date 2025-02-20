import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final int? rating;
  final String? review;
  final String? createdAt;
  @JsonKey(name: 'User')
  final ReviewUser? User;
  @JsonKey(name: 'Apartment')
  final ReviewApartment? Apartment;

  Review(this.rating, this.review, this.createdAt, this.User, this.Apartment);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class ReviewUser {
  final String? firstName;
  final String? lastName;
  final String? profilePicture;

  ReviewUser(this.firstName, this.lastName, this.profilePicture);

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewUserToJson(this);
}

@JsonSerializable()
class ReviewApartment {
  @JsonKey(name: 'ApartmentName')
  final String? ApartmentName;
  @JsonKey(name: 'ApartmentAddress')
  final ReviewApartmentApartmentAddress? ApartmentAddress;
  @JsonKey(name: 'ApartmentImage')
  final String? ApartmentImage;

  ReviewApartment(this.ApartmentName, this.ApartmentAddress,
      this.ApartmentImage);

  factory ReviewApartment.fromJson(Map<String, dynamic> json) =>
      _$ReviewApartmentFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewApartmentToJson(this);
}

@JsonSerializable()
class ReviewApartmentApartmentAddress {
  @JsonKey(name: 'District')
  final ReviewApartmentApartmentAddressDistrict? District;

  ReviewApartmentApartmentAddress(this.District);

  factory ReviewApartmentApartmentAddress.fromJson(Map<String, dynamic> json) =>
      _$ReviewApartmentApartmentAddressFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReviewApartmentApartmentAddressToJson(this);
}

@JsonSerializable()
class ReviewApartmentApartmentAddressDistrict {
  final String? name;
  @JsonKey(name: 'City')
  final ReviewApartmentApartmentAddressDistrictCity? City;

  ReviewApartmentApartmentAddressDistrict(this.name, this.City);

  factory ReviewApartmentApartmentAddressDistrict.fromJson(
      Map<String, dynamic> json) =>
      _$ReviewApartmentApartmentAddressDistrictFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReviewApartmentApartmentAddressDistrictToJson(this);
}

@JsonSerializable()
class ReviewApartmentApartmentAddressDistrictCity {
  final String? name;

  ReviewApartmentApartmentAddressDistrictCity(this.name);

  factory ReviewApartmentApartmentAddressDistrictCity.fromJson(
      Map<String, dynamic> json) =>
      _$ReviewApartmentApartmentAddressDistrictCityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReviewApartmentApartmentAddressDistrictCityToJson(this);
}
