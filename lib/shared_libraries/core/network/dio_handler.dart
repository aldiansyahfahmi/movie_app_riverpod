import 'package:dio/dio.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_interceptors.dart';

class DioHandler {
  final String apiBaseUrl;
  late SharedPreferences sharedPreferences;

  DioHandler({
    required this.apiBaseUrl,
    required this.sharedPreferences,
  });

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      queryParameters: {
        'api_key': AppConstants.appApi.key,
      },
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
    );
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors(sharedPreferences: sharedPreferences));

    return dio;
  }
}
