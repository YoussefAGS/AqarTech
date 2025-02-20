import 'package:aqartech/core/common/constants.dart';
import 'package:aqartech/core/common/shared_pref_helper.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/features/booking/data/models/contact_details.dart';
import 'package:aqartech/features/booking/data/models/credit_card.dart';
import 'package:aqartech/features/booking/data/models/customer_billing.dart';
import 'package:aqartech/features/booking/data/models/saved_credit_cared.dart';
import 'package:aqartech/features/booking/data/models/transaction_referance.dart';
import 'package:aqartech/features/booking/data/models/update_customer_billing.dart';
import 'package:aqartech/features/booking/data/repo/booking_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKNetworks.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKSavedCardInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokenFormat.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_out_state.dart';

part 'check_out_cubit.freezed.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  BookingRepo bookingRepo;
  String bookingId = '';
  double totalAmount = 0.0;
  bool isLock = false;

  CheckOutCubit(this.bookingRepo) : super(const CheckOutState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  // void getCustomerBilling() async {
  //   await PaymentConfigManager().initializeConfig();
  //   if (isLoggedInUser) {
  //     emit(const CheckOutState.loading());
  //     final result = await bookingRepo.getCustomerBilling();
  //
  //     if (isClosed) return;
  //     result.when(
  //       success: (data) {
  //         if (data.CustomerBillingInfo?.isNotEmpty ?? false) {
  //           nameController.text = data.CustomerBillingInfo?[0]?.name ?? '';
  //           emailConfirmController.text =
  //               data.CustomerBillingInfo?[0]?.email ?? '';
  //           emailController.text = data.CustomerBillingInfo?[0]?.email ?? '';
  //           phoneController.text =
  //               data.CustomerBillingInfo?[0]?.phoneNumber ?? '';
  //           addressController.text =
  //               data.CustomerBillingInfo?[0]?.addressLine ?? '';
  //           countryController.text =
  //               data.CustomerBillingInfo?[0]?.country ?? '';
  //           cityController.text = data.CustomerBillingInfo?[0]?.city ?? '';
  //           stateController.text = data.CustomerBillingInfo?[0]?.state ?? '';
  //           zipCodeController.text =
  //               data.CustomerBillingInfo?[0]?.postalCode ?? '';
  //         }
  //         // emit(CheckOutState.customerBillingSuccess(data));
  //       },
  //       failure: (message) => emit(
  //           CheckOutState.failure(message: message.apiErrorModel.message!)),
  //     );
  //   }
  // }

  BillingDetails _createBillingDetails() {
    return BillingDetails(
      nameController.text,
      emailController.text,
      phoneController.text,
      addressController.text,
      countryController.text,
      cityController.text,
      stateController.text,
      zipCodeController.text,
    );
  }

  void unlockBooking() async {
    if (!isLock || bookingId.isEmpty) return;
    final result = await bookingRepo.unLockBooking(id: bookingId);
    result.when(
      success: (data) {},
      failure: (message) {
        ShowToast.showToastErrorTop(message: message.apiErrorModel.message!);
      },
    );
  }

  void transactionReferance(String transactionReference) async {
    TransactionReferance transactionReferance = TransactionReferance(
        transactionRef: transactionReference,
        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        addressLine: addressController.text,
        city: cityController.text,
        state: stateController.text,
        postalCode: zipCodeController.text,
        country: countryController.text);
    final result = await bookingRepo.transactionReferance(
        id: bookingId, transactionReferance: transactionReferance);
    result.when(
        success: (data) {},
        failure: (message) async {
          await bookingRepo.transactionReferance(
              id: bookingId, transactionReferance: transactionReferance);
        });
  }

  // void makePayment() {}

  void payWithToken(SavedCreditCared card, BuildContext context) async {
    if (bookingId.isEmpty) {
      ShowToast.showToastWarningTop(
          message: context.translate(LangKeys.bookingUnavailable));
      return;
    }
    // final List<String?> results = await Future.wait<String?>([
    //   SharedPrefHelper.getSecuredString(SharedPrefKeys.PAYMENT_SERVER_KEY),
    //   SharedPrefHelper.getSecuredString(SharedPrefKeys.PAYMENT_CLIENT_KEY),
    //   SharedPrefHelper.getSecuredString(SharedPrefKeys.PAYMENT_PROFILE_ID),
    //   SharedPrefHelper.getSecuredString(SharedPrefKeys.PAYTABS_MERCHANT_NAME),
    // ]);
    // Assign each result to its respective variable
    // final paymentServerKey = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYMENT_SERVER_KEY);
    // final paymentClientKey = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYMENT_CLIENT_KEY);
    // final paymentProfileId = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYMENT_PROFILE_ID);
    //
    // final merchantName = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYTABS_MERCHANT_NAME);

    // print(paymentServerKey);
    // print(paymentClientKey);
    // print(paymentProfileId);
    // print(merchantName);
    bool isValid = true;
    ShowToast.showToastSuccessTop(
        message: context.translate(LangKeys.checkingData), seconds: 2);

    ContactDetails contactDetails = ContactDetails(email: emailController.text, phone: phoneController.text);
    final resalt = await bookingRepo.checkAvilablity(
        Id: bookingId, contactDetails: contactDetails);
    resalt.when(success: (data) {
      isLock = true;
    }, failure: (message) {
      ShowToast.showToastWarningTop(
          message: message.apiErrorModel.message ?? "");
      isValid = false;
      return;
    });
    // context.pop();
    if (!isValid) {
      return;
    }
    // Configuration for the PayTabs payment
    var configuration = PaymentSdkConfigurationDetails(
      // profileId: paymentProfileId,
      // serverKey: paymentServerKey,
      // clientKey: paymentClientKey,
      cartId: bookingId,
      transactionType: PaymentSdkTransactionType.SALE,
      tokeniseType: PaymentSdkTokeniseType.MERCHANT_MANDATORY,
      tokenFormat: PaymentSdkTokenFormat.AlphaNum20Format,
      cartDescription: "Payment for booking $bookingId",
      // merchantName: merchantName,
      screentTitle: "Pay with Card",
      billingDetails: _createBillingDetails(),
      locale: PaymentSdkLocale.EN,
      amount: totalAmount,
      currencyCode: "EGP",
      merchantCountryCode: "EG",
      paymentNetworks: [
        PaymentSDKNetworks.visa,
        PaymentSDKNetworks.masterCard,
        PaymentSDKNetworks.discover,
        PaymentSDKNetworks.JCB,
        PaymentSDKNetworks.meeza,
        PaymentSDKNetworks.amex,
        PaymentSDKNetworks.vPay
      ],
      iOSThemeConfigurations: IOSThemeConfigurations(
        // primaryColor: "#4F8F92",
        logoImage: "assets/images/core/logo2.png",
        secondaryColor: "#4F8F92",

        // placeholderColor: "#4F8F92"
      ),
    );
    // Start the PayTabs card payment
    var savedCardInfo = PaymentSDKSavedCardInfo("${card.cardMask}", "${card.cardType}");
    FlutterPaytabsBridge.start3DSecureTokenizedCardPayment(
        configuration, savedCardInfo, "${card.cardToken}", (event) async {
      if (event["status"] == "success") {
        var transactionDetails = event["data"];
        if (transactionDetails["isSuccess"]) {
          // ShowToast.top(message: "your booking has been successful");
          // context.pushReplacementNamed(AppRoute.search);
          // print(event["data"]);


          // AddCreditCard creditCard = AddCreditCard(
          //     cardScheme: transactionDetails["paymentInfo"]["cardScheme"],
          //     cardType: transactionDetails["paymentInfo"]["cardType"],
          //     cardMask: transactionDetails["paymentInfo"]["paymentDescription"],
          //     cardToken: transactionDetails["token"]);

          emit(CheckOutState.success());
          transactionReferance(transactionDetails["transactionReference"]);
          if (isLoggedInUser) {
            UpdateCustomerBilling updateCustomerBilling = UpdateCustomerBilling(
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phoneController.text,
              addressLine: addressController.text,
              city: cityController.text,
              state: stateController.text,
              postalCode: zipCodeController.text,
              country: countryController.text,
            );
            await bookingRepo.updateCustomerBilling(
                updateCustomerBilling: updateCustomerBilling);
          }
        }
        else {
          unlockBooking();

          ShowToast.showToastErrorTop(
              message: transactionDetails["paymentResult"]["responseMessage"]);
        }
      }
      else if (event["status"] == "error") {
        ShowToast.showToastErrorTop(
            message: context.translate(LangKeys.invalidInfoOrError));
        unlockBooking();
        // Handle error here.
      }
      else if (event["status"] == "event") {
        unlockBooking();
        // Handle cancel events here.
      }
    });
  }
  void initiatePayment(BuildContext context) async {
    if (bookingId.isEmpty) {
      ShowToast.showToastWarningTop(
          message: context.translate(LangKeys.bookingUnavailable));
      return;
    }
    // final paymentServerKey = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYMENT_SERVER_KEY);
    // final paymentClientKey = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYMENT_CLIENT_KEY);
    // final paymentProfileId = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYMENT_PROFILE_ID);
    //
    // final merchantName = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.PAYTABS_MERCHANT_NAME);
    // print(paymentServerKey);
    // print(paymentClientKey);
    // print(paymentProfileId);
    // print(merchantName);
    // emit(const CheckOutState.loading());
    bool isValid = true;
    // showLoading(context);
    ShowToast.showToastSuccessTop(
        message: context.translate(LangKeys.checkingData), seconds: 2);

    ContactDetails contactDetails = ContactDetails(
        email: emailController.text, phone: phoneController.text);
    final resalt = await bookingRepo.checkAvilablity(
        Id: bookingId, contactDetails: contactDetails);
    resalt.when(success: (data) {
      isLock = true;
    }, failure: (message) {
      ShowToast.showToastWarningTop(
          message: message.apiErrorModel.message ?? "");
      isValid = false;
      return;
    });

    if (!isValid) {
      // ShowToast.showToastWarningTop(message: context.translate(LangKeys.bookingUnavailable));
      return;
    }

    var configuration = PaymentSdkConfigurationDetails(
      // profileId: paymentProfileId,
      // serverKey: paymentServerKey,
      // clientKey: paymentClientKey,
      cartId: bookingId,
      transactionType: PaymentSdkTransactionType.SALE,
      tokeniseType: isLoggedInUser?PaymentSdkTokeniseType.USER_OPTIONAL:PaymentSdkTokeniseType.NONE,
      tokenFormat: PaymentSdkTokenFormat.AlphaNum20Format,
      cartDescription: "12345",
      // merchantName: merchantName,
      screentTitle: "Pay with Card",
      billingDetails: _createBillingDetails(),
      locale: PaymentSdkLocale.EN,
      amount: totalAmount,

      // Amount in double
      currencyCode: "EGP",
      merchantCountryCode: "EG",
      paymentNetworks: [
        PaymentSDKNetworks.visa,
        PaymentSDKNetworks.masterCard,
        PaymentSDKNetworks.discover,
        PaymentSDKNetworks.JCB,
        PaymentSDKNetworks.meeza,
        PaymentSDKNetworks.amex,
        PaymentSDKNetworks.vPay
      ],
      iOSThemeConfigurations: IOSThemeConfigurations(
        // primaryColor: "#4F8F92",
        logoImage: "assets/images/app_icons/icon_app.png",
        secondaryColor: "#4F8F92",

        // placeholderColor: "#4F8F92"
      ),
    );

    // Start the PayTabs card payment
    FlutterPaytabsBridge.startCardPayment(configuration,
            (event) async {
      if (event["status"] == "success") {
        var transactionDetails = event["data"];
        if (transactionDetails["isSuccess"]) {
          print(transactionDetails);
          print(transactionDetails["token"]);

          print(event["data"]);

          AddCreditCard creditCard = AddCreditCard(
              cardScheme: transactionDetails["paymentInfo"]["cardScheme"],
              cardType: transactionDetails["paymentInfo"]["cardType"],
              cardMask: transactionDetails["paymentInfo"]["paymentDescription"],
              cardToken: transactionDetails["token"]==null?"":transactionDetails["token"]);
          if(isLoggedInUser&&creditCard.cardToken.isNotEmpty){
            bookingRepo.saveCreditCard(creditCard: creditCard);
          }
          emit(CheckOutState.success());
          transactionReferance(transactionDetails["transactionReference"]);

          if (isLoggedInUser) {
            UpdateCustomerBilling updateCustomerBilling = UpdateCustomerBilling(
              email: emailController.text,
              phoneNumber: phoneController.text,
              addressLine: addressController.text,
              city: cityController.text,
              state: stateController.text,
              postalCode: zipCodeController.text,
              country: countryController.text,
              name: nameController.text,
            );
            await bookingRepo.updateCustomerBilling(
                updateCustomerBilling: updateCustomerBilling);
          }
        }
        else {
          ShowToast.showToastErrorTop(
              message: transactionDetails["paymentResult"]["responseMessage"]);
          unlockBooking();
        }
      } else if (event["status"] == "error") {
        ShowToast.showToastErrorTop(
            message: context.translate(LangKeys.invalidInfoOrError));
        unlockBooking();
        // Handle error here.
      } else if (event["status"] == "event") {
        unlockBooking();
      }
    }
    );
  }
}
