import 'package:json_annotation/json_annotation.dart';

part 'booking_date_response.g.dart';

@JsonSerializable()
class BookingDateResponse {
  final String? message;
  final BookingDateResponseBooking? booking;

  BookingDateResponse(this.message, this.booking);

  factory BookingDateResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDateResponseToJson(this);
}

@JsonSerializable()
class BookingDateResponseBooking {
  final BookingDateResponseBookingLocalizedBookedApartment?
      localizedBookedApartment;
  final BookingDateResponseBookingPriceWithoutOffer? priceWithoutOffer;

  BookingDateResponseBooking(
      this.localizedBookedApartment, this.priceWithoutOffer);

  factory BookingDateResponseBooking.fromJson(Map<String, dynamic> json) =>
      _$BookingDateResponseBookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDateResponseBookingToJson(this);
}

@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartment {
  final String? bookingId;
  final double? totalPrice;
  final double? vat;
  final String? checkInDate;
  final String? checkOutDate;
  final int? numberOfNights;
  final double? payableNights;
  final bool? isOfferApplied;
  final double? totalNightsPrice;
  final String? bookingStatus;
  final List<BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns?>?
      bookingAddons;
  final double? addOnsTotalPrice;
  @JsonKey(name: 'Apartment')
  final BookingDateResponseBookingLocalizedBookedApartmentApartment? Apartment;

  BookingDateResponseBookingLocalizedBookedApartment(
      this.bookingId,
      this.totalPrice,
      this.vat,
      this.checkInDate,
      this.checkOutDate,
      this.numberOfNights,
      this.payableNights,
      this.isOfferApplied,
      this.totalNightsPrice,
      this.bookingStatus,
      this.bookingAddons,
      this.addOnsTotalPrice,
      this.Apartment);

  factory BookingDateResponseBookingLocalizedBookedApartment.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentToJson(this);
}

@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartmentBookingAddons {
  final String? id;
  final String? type;
  final double? pricePerDay;

  BookingDateResponseBookingLocalizedBookedApartmentBookingAddons(
      this.id, this.type, this.pricePerDay);

  factory BookingDateResponseBookingLocalizedBookedApartmentBookingAddons.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentBookingAddonsFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentBookingAddonsToJson(
          this);
}

@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartmentApartment {
  final String? name;
  final double? nightlyPrice;
  @JsonKey(name: 'ApartmentImage')
  final String? ApartmentImage;
  final double? avgRating;
  final int? reviewCount;
  @JsonKey(name: 'ApartmentAddress')
  final BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddress?
      ApartmentAddress;
  @JsonKey(name: 'ApartmentAddOns')
  final List<
          BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns?>?
      ApartmentAddOns;

  BookingDateResponseBookingLocalizedBookedApartmentApartment(
      this.name,
      this.nightlyPrice,
      this.ApartmentImage,
      this.avgRating,
      this.reviewCount,
      this.ApartmentAddress,
      this.ApartmentAddOns);

  factory BookingDateResponseBookingLocalizedBookedApartmentApartment.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentToJson(this);
}


@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddress {
  final String? addressLine;
  @JsonKey(name: 'District')
  final BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrict?
      district;

  BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddress(
      this.addressLine, this.district);

  factory BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddress.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressToJson(
          this);
}

@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrict {
  final String? name;
  @JsonKey(name: 'City')
  final BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictCity?
      city;

  BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrict(
      this.name, this.city);

  factory BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrict.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictToJson(
          this);
}

@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictCity {
  final String? name;

  BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictCity(
      this.name);

  factory BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictCity.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictCityFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddressDistrictCityToJson(
          this);
}

@JsonSerializable()
class BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns {
  final String? id;
  final String? type;
  final double? price;

  BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns(
      this.id, this.type, this.price);

  factory BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOns.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOnsFromJson(
          json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingLocalizedBookedApartmentApartmentApartmentAddOnsToJson(
          this);
}

@JsonSerializable()
class BookingDateResponseBookingPriceWithoutOffer {
  @JsonKey(name: 'NightsPrice')
  final int? nightsPrice;
  final double? vat;
  final double? total;

  BookingDateResponseBookingPriceWithoutOffer(
      this.nightsPrice, this.vat, this.total);

  factory BookingDateResponseBookingPriceWithoutOffer.fromJson(
          Map<String, dynamic> json) =>
      _$BookingDateResponseBookingPriceWithoutOfferFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BookingDateResponseBookingPriceWithoutOfferToJson(this);
}
