import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String contentType = "content-type";
const String applicationJson = "application/json";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  Dio getDio() {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization:
          "key=AAAAT-ACqDI:APA91bGzwHfq1RkI3qL1ZtQ6YzpWLRsrjjF-PLXjGPtVR8NH0KlYXzFde-bNBQjSZZh_HkV-0z3TKNfZd_a_u7a5PLgKfx9UR9tud2b_5sdrPDlz6043NgxpM8o4HOyjefiVz31HqdNA",
    };
    dio.options = BaseOptions(
      baseUrl: '',
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: headers,
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
