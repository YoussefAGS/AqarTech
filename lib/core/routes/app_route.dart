import 'package:aqartech/features/community/ui/screens/add_post_screen.dart';
import 'package:aqartech/features/home/logic/home_cubit.dart';
import 'package:aqartech/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/signup_screen.dart';
import '../../features/booking/logic/add_delete_card_cubit/add_delete_card_cubit.dart';
import '../../features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import '../../features/booking/logic/checkout_cubit/check_out_cubit.dart';
import '../../features/booking/logic/saved_card_cubit/saved_card_cubit.dart';
import '../../features/booking/ui/screens/checkout_screen.dart';
import '../../features/booking/ui/widgets/billing_form.dart';
import '../../features/main/ui/screens/main_screen_app.dart';
import '../../features/villa_description/ui/screens/villa_details_screen.dart';
import '../di/injection_container.dart';
import '../utils/underplid.dart';
import 'basi_route.dart';

class AppRoute {
  static const String homeLayout = "HomeLayout";
  static const String villaDetailsRoute = "villaDetailsRoute";
  static const String addPostScreen = "addPostScreen";

  static const String loginScreen = "loginScreen";
  static const String forgotPassword = "forgotPassword";
  static const String signupScreen = "signupScreen";
  static const String onboardingScreen = "onboardingScreen";
  static const String hotelInfoScreen = "hotelInfoScreen";
  static const String search = "search";
  static const String checkoutScreen = "checkoutScreen";
  static const String fillInfoScreen = "fillInfoScreen";
  static const String homeScreen = "homeScreen";
  static const String activeProjects = "ActiveProjects";
  static const String projectDetails1 = "projectDetails";
  static const String projectsOverview = "projectsOverview";
  static const String viewPaymentScreen = "ViewPaymentScreen";
  static const String mainScreen = "mainScreen";
  static const String start = "start";
  static const String topRated = "topRated";
  static const String avilableCardScreen = "AvilableCardScreen";
  static const String historyBookingScreen = "HistoryBookingScreen";
  static const String contactUs = "contactUs";
  static const String configurations = "configurations";
  static const String chatScreen = "chatScreen";
  static const String projectChat = "projectChat";
  static const String profileScreen = "profileScreen";
  static const String profileDitailsssss = "profileDitailsssss";

  static Route<void> routes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case checkoutScreen:
        return MaterialPageRoute(builder: (context) {
          final String id = args is String ? args : "";
          print("hotel id $id");
          CheckOutCubit cubit = getIt<CheckOutCubit>();
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
              // BlocProvider(
              //     create: (context) =>
              //     getIt<CheckOutCubit>()..getCustomerBilling()
              // ),
              BlocProvider(create: (context) => getIt<BookingDateCubit>()),
            ],
            child: CheckoutScreen(
              id: id,
            ),
          );
        });
        case fillInfoScreen:
      return MaterialPageRoute(builder: (context) {
        final CheckOutCubit? cubit = args is CheckOutCubit ? args : null;
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: cubit!,
            ),
            BlocProvider(
              create: (context) => getIt<AddDeleteCardCubit>(),
            ),
            BlocProvider(
                create: (context) =>
                getIt<SavedCardCubit>()),
          ],
          child: BillingFormBottomSheet(),
        );
      });

      case addPostScreen:
        return MaterialPageRoute(
          builder: (_) => AddPostScreen(),

        );
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) {
            // Ensure args is an int and pass it to MainScreen
            final initialPage = args is int ? args : 0;
            return MainScreen(
              initialPage: initialPage,
            );
          },
        );
      case villaDetailsRoute:
        return MaterialPageRoute(
            builder: (context) => VillaDetailsScreen(id: '',));
      case homeScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => getIt<HomeCubit>(),
                  child: const HomeScreen(),
                ));
      case loginScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case signupScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignupScreen(),
                ));


      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
