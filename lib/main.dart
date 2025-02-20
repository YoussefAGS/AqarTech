
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'aqar_tech_app.dart';
import 'core/app/bloc_observer.dart';
import 'core/common/constants.dart';
import 'core/common/shared_pref_helper.dart';
import 'core/di/injection_container.dart';
import 'core/utils/show_toast.dart';


void main() async {
  // Load the .env file
  // Load the .env file
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  Bloc.observer = AppBlocObserver();
  await SharedPrefHelper().instantiatePreferences();
  // await PaymentConfigManager().initializeConfig();
  await setupGetIt();
  await checkIfLoggedInUser();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const AqarTech());
  });
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      ShowToast.cancelActiveToast(); // Cancel active toast when the app is not active
    }
  }
}
checkIfLoggedInUser() async {
  String userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  isFirstTime = await SharedPrefHelper.getBool(SharedPrefKeys.firstLaunch);
  if (userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
