import 'package:dematec_mobile/core/constants/env_constants.dart';
import 'package:dematec_mobile/core/enum/general/preferences_enum.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:dematec_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeProvider extends ChangeNotifier {
  final PrefService _prefService;

  String _appVersion = 'Carregando...';
  String get appVersion => _appVersion;

  String _userFullName = "Usuário não encontrado";
  String get userFullName => _userFullName;

  String _companyName = 'Dematec';
  String get companyName => _companyName;

  String _initialsName = 'UN';
  String get initialsName => _initialsName;

  String _currentApiUrl = 'Carregando...';
  String get currentApiUrl => _currentApiUrl;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  HomeProvider(this._prefService) {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    await _loadAppVersion();
    _loadUserData();
    _loadApiUrl();

    _isLoading = false;
    notifyListeners();
  }

  void _loadUserData() {
    _userFullName = _prefService.getPref(
      PreferencesEnum.userFullName,
      defaultValue: "Usuário não Encontrado",
    );
    _companyName = _prefService.getPref(
      PreferencesEnum.companyName,
      defaultValue: "Dematec",
    );

    _initialsName = Util.getInitialsName(_userFullName);
  }

  void _loadApiUrl() {
    final customUrl = _prefService.getPref(PreferencesEnum.apiUrl);

    if (customUrl.isNotEmpty) {
      _currentApiUrl = customUrl;
    } else {
      _currentApiUrl = EnvConstants.apiUrlBase;
    }
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
  }
}
