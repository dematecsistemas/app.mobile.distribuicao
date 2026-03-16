import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/core/network/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';

class MainProviders {
  static List<SingleChildWidget> getProviders(SharedPreferences prefs) {
    return [
      Provider<PrefService>(create: (_) => PrefService(prefs)),

      Provider<Dio>(
        create: (context) => DioConfig.build(context.read<PrefService>()),
      ),

      Provider<ApiClient>(create: (context) => ApiClient(context.read<Dio>())),
    ];
  }
}
