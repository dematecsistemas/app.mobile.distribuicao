import 'package:dematec_mobile/core/constants/env_constants.dart';
import 'package:dematec_mobile/core/network/interceptors/dynamic_api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:dematec_mobile/core/network/interceptors/auth_interceptor.dart';

class DioConfig {
  DioConfig._();

  static Dio build(PrefService prefService) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConstants.apiUrlBase,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll([
      DynamicApiInterceptor(prefService),
      AuthInterceptor(prefService),
      LogInterceptor(responseBody: true, requestBody: true),
    ]);

    return dio;
  }
}
