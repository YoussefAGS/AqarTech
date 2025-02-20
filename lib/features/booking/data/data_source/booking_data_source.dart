



import '../../../../core/common/succcess_model_response.dart';
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
abstract class BookingDataSource {
  Future<BookingDateResponse> bookADate(
      {required BookingDateRequest bookingDateRequest, required String id,required String lang});
  Future<List<SavedCreditCared>> getCreditCards();
  Future<CreditCardResponse> saveCreditCard({required AddCreditCard creditCard});
  Future<CheckAvilablity> checkAvilablity({required String id,required ContactDetails contactDetails});
  Future<SuccessModelResponse>deleteCard();
  Future<List<UnAvailableDates>> getUnAvailableDates({required String id});
  Future<CustomerBilling> getCustomerBilling();
  Future<CustomerBilling> updateCustomerBilling({required UpdateCustomerBilling updateCustomerBilling});
  Future<SuccessModelResponse> unLockBooking({required String id});
  Future<SuccessModelResponse> transactionReferance({required String id,required TransactionReferance transactionReferance});

  Future<BookingDateResponse> addBookingServices(
      { required AddRemoveService serviceId,required String bookingId,required String lang});
  Future<BookingDateResponse> removeBookingServices(
      { required AddRemoveService serviceId,required String bookingId,required String lang});
}