import 'package:flutter/foundation.dart';
import 'package:dematec_mobile/core/constants/endpoints/base_url.dart';

class EnvConstants {
  EnvConstants._();

  static const String apiUrlBase = String.fromEnvironment(
    'API_URL',
    defaultValue: kDebugMode ? BaseUrl.baseUrlDev : BaseUrl.baseUrlProd,
  );
  static const bool isDev = bool.fromEnvironment('IS_DEV', defaultValue: false);
  static const bool isAdmin = bool.fromEnvironment(
    'IS_ADMIN',
    defaultValue: false,
  );
}
