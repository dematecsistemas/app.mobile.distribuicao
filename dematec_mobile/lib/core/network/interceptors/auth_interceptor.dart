import 'package:dio/dio.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';

class AuthInterceptor extends Interceptor {
  final PrefService _prefService;

  AuthInterceptor(this._prefService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _prefService.getToken();

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _prefService.removeToken();
      // O redirecionamento para o Login deve ser tratado pela UI ou Router, não pelo Dio!
    }
    handler.next(err);
  }
}
