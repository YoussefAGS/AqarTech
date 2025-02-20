import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String token1 ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOWMwZDkwNC0xMGFkLTRkMmQtOGFjZC1jZjY0NzQ3ZmNjNzciLCJpYXQiOjE3MzIyMzc5NTMsImV4cCI6MTc2Mzc5NTU1M30.cNDekdGdGuvhdK1ar5pAbCZGg4ljsonxsae6ygTkz1w";
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  static Dio? dioWithToken;


  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    }
    else {
      return dio!;
    }
  }
  static Dio getDioWithToken() {
    Duration timeOut = const Duration(seconds: 30);

    if (dioWithToken == null) {
      dioWithToken = Dio();
      dioWithToken!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      dioWithToken?.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
      return dioWithToken!;
    }
    else {
      return dioWithToken!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
      // 'Cookie': 'jwt=${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
      'Authorization': 'Bearer $token1',
      'Cookie': 'jwt=$token1',

    };
  }
  static void clearTokenFromHeader() {
    dio?.options.headers.remove('Authorization');
    dio?.options.headers.remove('Cookie');
  }
  static void clearDio() {
    dio = null;
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token1',
      'Cookie':'jwt=$token1',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

}
