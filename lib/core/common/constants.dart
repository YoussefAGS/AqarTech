bool isLoggedInUser = false;
String? id ;
bool isFirstTime = true ;
String noImage="https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg";


class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String userId = 'Userid';
  static const String mode = 'mode';
  static const String language = 'language';
  static const String userInfo = 'loginResponseData';
  static const String profile = 'Profile';

  static const String firstLaunch = 'firstLanche';


  static const String phoneNumber = 'phoneNumber';
  static const String SERVER = 'SERVER';
  static const String CLIENT = 'CLIENT';

  static const String PROFILE = 'PROFILE';

  static const String MERCHANT = 'MERCHANT';

}
