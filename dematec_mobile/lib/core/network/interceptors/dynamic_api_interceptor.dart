import 'package:dematec_mobile/core/enum/general/preferences_enum.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:dio/dio.dart';

class DynamicApiInterceptor extends Interceptor {
  final PrefService _prefService;

  DynamicApiInterceptor(this._prefService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final customUrl = _prefService.getPref(PreferencesEnum.apiUrl);

    if (customUrl.isNotEmpty) {
      options.baseUrl = customUrl;
    }

    handler.next(options);
  }
}
