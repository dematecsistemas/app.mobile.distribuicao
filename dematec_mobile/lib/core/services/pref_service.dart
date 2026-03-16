import 'package:dematec_mobile/core/enum/general/preferences_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  final SharedPreferences _prefs;

  PrefService(this._prefs);

  Future<bool> savePref(PreferencesEnum key, String value) async {
    try {
      return await _prefs.setString(key.code, value);
    } catch (e) {
      return false;
    }
  }

  String getPref(PreferencesEnum key, {String defaultValue = ""}) {
    final value = _prefs.getString(key.code);
    return (value != null && value.isNotEmpty) ? value : defaultValue;
  }

  Future<void> remove(PreferencesEnum key) async {
    await _prefs.remove(key.code);
  }

  Future<bool> saveToken(String token) async {
    try {
      return await _prefs.setString(PreferencesEnum.token.code, token);
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeToken() async {
    try {
      return await _prefs.remove(PreferencesEnum.token.code);
    } catch (e) {
      return false;
    }
  }

  String getToken() {
    return _prefs.getString(PreferencesEnum.token.code) ?? '';
  }
}
