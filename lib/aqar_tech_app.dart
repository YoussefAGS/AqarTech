
import 'package:aqartech/features/villa_description/ui/refactor/villa_details_body.dart';
import 'package:aqartech/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app/app_cubit/app_cubit.dart';
import 'core/di/injection_container.dart';
import 'core/language/app_localizations_setup.dart';
import 'core/routes/app_route.dart';
import 'features/profile/ui/screens/profile_screen.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AqarTech extends StatelessWidget {
  const AqarTech({super.key});

  // This widget is the root of your application.
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<AppCubit>()
        ..getSavedLanguage(),
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final cubit = context.read<AppCubit>();
          return ScreenUtilInit(
            designSize: const Size(375, 810),
            minTextAdapt: true,
            child: MaterialApp(
              navigatorKey: getIt<GlobalKey<NavigatorState>>(),
              locale: Locale(cubit.currentLangCode),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
              AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              title: 'AqarTech',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
              onGenerateRoute: AppRoute.routes,
              // initialRoute: !isFirstTime ? AppRoute.onboardingScreen: AppRoute.mainScreen,
              home:       SplashScreen(),

            ),
          );
        },
      ),
    );
  }
}


