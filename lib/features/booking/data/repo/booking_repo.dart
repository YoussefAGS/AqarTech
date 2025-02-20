import 'package:aqartech/core/common/succcess_model_response.dart';
import 'package:aqartech/core/networking/api_error_handler.dart';
import 'package:aqartech/core/networking/api_result.dart';
import 'package:aqartech/features/booking/data/data_source/booking_data_source.dart';
import 'package:aqartech/features/booking/data/models/booking_date_request.dart';
import 'package:aqartech/features/booking/data/models/booking_date_response.dart';
import 'package:aqartech/features/booking/data/models/check_avilablity.dart';
import 'package:aqartech/features/booking/data/models/contact_details.dart';
import 'package:aqartech/features/booking/data/models/credit_card.dart';
import 'package:aqartech/features/booking/data/models/credit_card_response.dart';
import 'package:aqartech/features/booking/data/models/customer_billing.dart';
import 'package:aqartech/features/booking/data/models/saved_credit_cared.dart';
import 'package:aqartech/features/booking/data/models/transaction_referance.dart';
import 'package:aqartech/features/booking/data/models/un_available_dates.dart';
import 'package:aqartech/features/booking/data/models/update_customer_billing.dart';

import '../models/add_remove_service.dart';

class BookingRepo {
  BookingDataSource bookingDataSource;

  BookingRepo({required this.bookingDataSource});

  Future<ApiResult<BookingDateResponse>> bookADate({required BookingDateRequest bookingDateRequest, required String id,required String lang}) async{
    try{
      final result = await bookingDataSource.bookADate(bookingDateRequest: bookingDateRequest, id: id,lang:lang);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<SavedCreditCared>>> getCreditCards() async{
    try{
      final result = await bookingDataSource.getCreditCards();
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<CreditCardResponse>> saveCreditCard({required AddCreditCard creditCard}) async{
    try{
      final result = await bookingDataSource.saveCreditCard(creditCard: creditCard);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CheckAvilablity>> checkAvilablity({required String Id,required ContactDetails contactDetails}) async{
    try{
      final result = await bookingDataSource.checkAvilablity(id: Id,contactDetails: contactDetails);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SuccessModelResponse>>deleteCard() async{
    try{
      final result = await bookingDataSource.deleteCard();
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<UnAvailableDates>>> getUnAvailableDates({required String id}) async{
    try{
      final result = await bookingDataSource.getUnAvailableDates(id: id);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CustomerBilling>> getCustomerBilling() async{
    try{
      final result = await bookingDataSource.getCustomerBilling();
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CustomerBilling>> updateCustomerBilling({required UpdateCustomerBilling updateCustomerBilling}) async{
    try{
      final result = await bookingDataSource.updateCustomerBilling(updateCustomerBilling: updateCustomerBilling);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<SuccessModelResponse>> unLockBooking({required String id}) async{
    try{
      final result = await bookingDataSource.unLockBooking(id: id);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SuccessModelResponse>> transactionReferance({required String id,required TransactionReferance transactionReferance}) async{
    try{
      final result = await bookingDataSource.transactionReferance(id: id,transactionReferance: transactionReferance);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<BookingDateResponse>> addBookingServices({ required String serviceId,required String bookingId,required String lang}) async{
    AddRemoveService service = AddRemoveService(serviceId);

    try{
      final result = await bookingDataSource.addBookingServices(serviceId: service,bookingId: bookingId,lang: lang);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BookingDateResponse>> removeBookingServices({ required String serviceId,required String bookingId,required String lang}) async{
    AddRemoveService service = AddRemoveService(serviceId);
    try{
      final result = await bookingDataSource.removeBookingServices(serviceId: service,bookingId: bookingId,lang: lang);
      return ApiResult.success( result);
    }catch(error){
      return ApiResult.failure( ErrorHandler.handle(error));
    }
  }


}