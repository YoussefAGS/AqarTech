

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/common/succcess_model_response.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/add_remove_service.dart';
import '../models/booking_date_request.dart';
import '../models/booking_date_response.dart';
import '../models/check_avilablity.dart';
import '../models/contact_details.dart';
import '../models/credit_card.dart';
import '../models/credit_card_response.dart';
import '../models/customer_billing.dart';
import '../models/saved_credit_cared.dart';
import '../models/transaction_referance.dart';
import '../models/un_available_dates.dart';
import '../models/update_customer_billing.dart';
import 'booking_data_source.dart';

part 'api_booking_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiBookingServices extends BookingDataSource {
  factory ApiBookingServices(Dio dio, {String baseUrl}) = _ApiBookingServices;
  @override
  @POST("/v1/apartments/{id}/book?locale={lang}")
  Future<BookingDateResponse> bookADate(
      {@Body() required BookingDateRequest bookingDateRequest, @Path("id") required String id,@Path("lang") required String lang});

  @override
  @POST("/v1/booking/lock-booking-for-user/{id}")
  Future<CheckAvilablity> checkAvilablity({@Path("id") required String id,@Body() required ContactDetails contactDetails});


  @override
  @GET("/v1/booking/unlock-apartment-booking/{id}")
  Future<SuccessModelResponse> unLockBooking({@Path("id") required String id});

  @override
  @POST("/v1/booking/user/save-card")
  Future<CreditCardResponse> saveCreditCard(
      {@Body() required AddCreditCard creditCard});

  @override
  @GET("/v1/booking/user/get-saved-cards")
  Future<List<SavedCreditCared>> getCreditCards();

  @override
  @DELETE("/v1/booking/user/delete-card")
  Future<SuccessModelResponse>deleteCard();

  @override
  @POST("/v1/user/upsert-billingInfo")
  Future<CustomerBilling> updateCustomerBilling({@Body() required UpdateCustomerBilling updateCustomerBilling});

  @override
  @GET("/v1/user/get-billingInfo")
  Future<CustomerBilling> getCustomerBilling();

  @override
  @GET("/v1/apartments/{id}/unavailable-dates")
  Future<List<UnAvailableDates>> getUnAvailableDates({@Path("id") required String id});

  @override
  @PUT("/v1/booking/update-payment-info/{id}")
  Future<SuccessModelResponse> transactionReferance({@Path("id") required String id,@Body() required TransactionReferance transactionReferance});


  @override
  @POST("/v1/booking/add-addon-to-booking/{id}?locale={lang}")
  Future<BookingDateResponse> addBookingServices({ @Body() required AddRemoveService serviceId, @Path("id")required String bookingId,@Path("lang") required String lang});

  @override
  @POST("/v1/booking/remove-addon-from-booking/{id}?locale={lang}")
  Future<BookingDateResponse> removeBookingServices({ @Body() required AddRemoveService serviceId, @Path("id")required String bookingId,@Path("lang") required String lang});


}
