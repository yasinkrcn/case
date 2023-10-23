import 'package:case_voco/src/core/constants/app_constants.dart';
import 'package:dio/dio.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = AppConstants.baseUrl;

    dio.options.validateStatus = (_) => true;

    // String accessToken =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjk2MTYyNDUwLCJleHAiOjE2OTYxNjYwNTB9.uODdo54-yMvcejmA71aejM_RPYudB8KGIEiteX2qB_s";

    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $accessToken"
    };

    dio.options.responseType = ResponseType.plain;

    dio.interceptors.add(LogInterceptor(requestBody: true, error: true, responseBody: true));
    return dio;
  }
}
