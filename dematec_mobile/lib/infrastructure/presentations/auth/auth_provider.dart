import 'package:dematec_mobile/core/enum/general/preferences_enum.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final PrefService _prefService;

  String? currentVersion;
  String? version;

  bool _loading = false;
  bool _rememberPassword = false;
  bool _viewPassword = false;
  List<String> errors = [];
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  AuthProvider(this._prefService) {
    _init();
  }

  void getDataSaveDevice() {
    controllerUser.text = _prefService.getPref(PreferencesEnum.username);
    controllerPassword.text = _prefService.getPref(PreferencesEnum.password);

    if (controllerUser.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
      rememberPassword = true;
    }
  }

  Future<void> _init() async {
    loading = true;
    rememberPassword = false;
    viewPassword = false;
    errors.clear();
    controllerUser.clear();
    controllerPassword.clear();
    getDataSaveDevice();
    loading = false;
  }

  bool get rememberPassword => _rememberPassword;
  set rememberPassword(bool value) {
    _rememberPassword = value;
    notifyListeners();
  }

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool get viewPassword => _viewPassword;
  set viewPassword(bool value) {
    _viewPassword = value;
    notifyListeners();
  }
}
