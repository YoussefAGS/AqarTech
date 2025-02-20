import 'package:aqartech/core/common/app_regex.dart';
import 'package:aqartech/core/common/constants.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/core/utils/widgets/app_text_button.dart';
import 'package:aqartech/core/utils/widgets/app_text_form_field.dart';
import 'package:aqartech/features/booking/data/models/saved_credit_cared.dart';
import 'package:aqartech/features/booking/logic/checkout_cubit/check_out_cubit.dart';
import 'package:aqartech/features/booking/logic/saved_card_cubit/saved_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/style/colors/colors.dart';
import '../../../../core/utils/widgets/custom_Sliver_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class BillingFormBottomSheet extends StatefulWidget {
  const BillingFormBottomSheet({super.key});

  @override
  State<BillingFormBottomSheet> createState() => _BillingFormBottomSheetState();
}

class _BillingFormBottomSheetState extends State<BillingFormBottomSheet> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    // Register the observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Unregister the observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // App is paused (e.g., user navigated away or terminated)
      context.read<CheckOutCubit>().unlockBooking();
    }
  }

  @override
  Widget build(context) {
    final checkOutCubit = context.read<CheckOutCubit>();
    final savedCardCubit = context.read<SavedCardCubit>();
    List<SavedCreditCared>? savedCards =
        context.select<SavedCardCubit, List<SavedCreditCared>?>(
      (cubit) => cubit.state.when(
        success: (savedCards) => savedCards,
        loading: () => null,
        failure: (e) => null,
        initial: () => null,
      ),
    );
    return Form(
      key: context.read<CheckOutCubit>().formKey,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title:context.translate(LangKeys.billingInformation),),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AppTextFormField(
                          controller:
                              context.read<CheckOutCubit>().nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.pleaseEnterAValidName);
                            }
                            return null;
                          },
                          hintText: context.translate(LangKeys.name),
                        ),
                        SizedBox(height: 16),
                        AppTextFormField(
                          controller:
                              context.read<CheckOutCubit>().emailController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !AppRegex.isEmailValid(value)) {
                              return context.translate( LangKeys.pleaseEnterAValidEmail);
                            }
                            return null;
                          },
                          hintText: context.translate(LangKeys.email),
                        ),
                        SizedBox(height: 16),
                        IntlPhoneField(
                          decoration:  InputDecoration(
                            labelText: context.translate(LangKeys.phoneNumber),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          controller:
                              context.read<CheckOutCubit>().phoneController,
                          initialCountryCode: 'SA', // Default country
                          onChanged: (phone) {
                            // print("Country code selected: ${phone.countryISOCode}");

                            context
                                .read<CheckOutCubit>()
                                .countryController
                                .text = phone.countryISOCode.toLowerCase();
                            print(context
                                .read<CheckOutCubit>()
                                .countryController
                                .text);
                          },
                        ),
                        SizedBox(height: 16),
                        AppTextFormField(
                          controller:
                              context.read<CheckOutCubit>().addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.pleaseEnterAValidAddress);
                            }
                            return null;
                          },
                          hintText: context.translate(LangKeys.address),
                        ),
                        SizedBox(height: 16),
                        AppTextFormField(
                          controller:
                              context.read<CheckOutCubit>().cityController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.pleaseEnterCityFirst);
                            }
                            return null;
                          },
                          hintText: context.translate(LangKeys.city),
                        ),
                        SizedBox(height: 16),
                        AppTextFormField(
                          controller:
                              context.read<CheckOutCubit>().stateController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.pleaseEnterYourState);
                            }
                            return null;
                          },
                          hintText: context.translate(LangKeys.state),
                        ),
                        SizedBox(height: 16),
                        AppTextFormField(
                          controller:
                              context.read<CheckOutCubit>().zipCodeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.pleaseEnterPostalCode);
                            }
                            return null;
                          },
                          hintText: context.translate(LangKeys.postalCode),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: BlocListener<SavedCardCubit, SavedCardState>(
                listener: (context, state) {
                  if (state is SavedCardFailure) {
                    ShowToast.showToastErrorTop(message: context.translate(LangKeys.networkError));
                  }
                },
                child: SizedBox.shrink(),
              )
              ,
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocListener<CheckOutCubit, CheckOutState>(
                      listenWhen: (previous, current) =>
                          current is CheckOutSuccess,
                      listener: (context, state) {
                        state.whenOrNull(
                          success: () {
                            // if (savedCardCubit.selectedCard != null || savedCardCubit.isHasError) {
                            //   final addDeleteCardCubit =
                            //       context.read<AddDeleteCardCubit>();
                            //   showPaymentSuccessBottomSheet(
                            //       context, true, addDeleteCardCubit, data);
                            // } else {
                            //   final addDeleteCardCubit =
                            //       context.read<AddDeleteCardCubit>();
                            //   showPaymentSuccessBottomSheet(
                            //       context, false, addDeleteCardCubit, data);
                            // }

                              showPaymentSuccessBottomSheet(context);




                          },
                        );
                      },
                       child:  CustomButton(text: "Pay Now", onPressed: () {
                          // context.pushName(AppRoute.homeScreen);
                          // context.read<LoginCubit>().emitLoginStates();
                        })
                      // child: AppTextButton(
                      //     backgroundColor: isLoggedInUser == false ? ColorsManager.mainColor : (savedCards != null ? ColorsManager.mainColor : ColorsManager.gray),
                      //     buttonText: context.translate(LangKeys.payNow),
                      //     textStyle: TextStyles.font16WhiteSemiBold
                      //         .copyWith(color: Colors.white),
                      //     onPressed: () {
                      //       if (isLoggedInUser == false) {
                      //         if (context.read<CheckOutCubit>().formKey.currentState!.validate()) {
                      //           context.read<CheckOutCubit>().initiatePayment(context);
                      //         }
                      //       }
                      //       else if (savedCards != null) {
                      //         if (context.read<CheckOutCubit>().formKey.currentState!.validate()) {
                      //           if (savedCards.isNotEmpty) {
                      //             showSavedCardsBottomSheet(
                      //                 context, savedCards, checkOutCubit);
                      //           } else {
                      //             context
                      //                 .read<CheckOutCubit>()
                      //                 .initiatePayment(context);
                      //           }
                      //         }
                      //       }
                      //     }),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

























void showPaymentSuccessBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: false, // Prevent dismissing by tapping outside
    enableDrag: false,    // Prevent dismissing by dragging
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/core/successpayment.png"),
              height: 80.sp,
              width: 80.sp,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // "Payment Success" text
            Text(
              context.translate(LangKeys.paymentSuccess),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.sp),
            // Descriptive text
            Text(
              context.translate(LangKeys.thanksForBookingWithUsWeWillContactYouSoon),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.sp),
            Row(
              children: [
                Expanded(
                  child: AppTextButton(
                      buttonText: context.translate(LangKeys.home),
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        context.pushNamedAndRemoveUntil(AppRoute.mainScreen,
                            arguments: 0);
                      }),
                ),
                // if (!isSavedCards && isLoggedInUser) SizedBox(width: 5.sp),
                // if (!isSavedCards && isLoggedInUser)
                //   Expanded(
                //     child: AppTextButton(
                //         buttonText: context.translate(LangKeys.saveCard),
                //         textStyle: TextStyles.font16WhiteSemiBold,
                //         onPressed: () {
                //           cubit.saveCreditCard(creditCard: addCreditCard);
                //           context.pushNamedAndRemoveUntil(AppRoute.mainScreen,
                //               arguments: 0);
                //         }),
                //   ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

void showSavedCardsBottomSheet(BuildContext context,
    List<SavedCreditCared> savedCards, CheckOutCubit checkOutCubit) {
  showModalBottomSheet(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: checkOutCubit,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.translate(LangKeys.selectSavedCard),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: savedCards.length,
                itemBuilder: (context, index) {
                  final card = savedCards[index];
                  return Card(
                    color: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 10.sp),
                    child: ListTile(
                      title: Text("${card.cardScheme} - ${card.cardMask}"),
                      subtitle: Text("${card.cardType}"),
                      onTap: () {
                        context.pop();
                        checkOutCubit.payWithToken(card, context);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

