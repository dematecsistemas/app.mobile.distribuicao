import 'package:flutter/material.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashProvider extends ChangeNotifier {
  final PrefService _prefService;

  String _appVersion = 'Carregando...';
  String get appVersion => _appVersion;

  SplashProvider(this._prefService) {
    _init();
  }

  Future<void> _init() async {
    // await Future.delayed(const Duration(seconds: 10));

    await _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    notifyListeners();
  }

  Future<String> determineNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = _prefService.getToken();

    if (token.isNotEmpty) {
      return '/home';
    } else {
      return '/auth';
    }
  }
}
