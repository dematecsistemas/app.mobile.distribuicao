enum PreferencesEnum {
  // auth
  username,
  password,
  token,

  // user
  userId,
  avatar,
  userFullName,
  companyName,
  permission,
  sellerCode,

  // legacy
  authTokenLegacy,

  // api
  apiUrl,
}

extension PreferencesEnumExt on PreferencesEnum {
  String get code {
    switch (this) {
      case PreferencesEnum.username:
        return 'username';
      case PreferencesEnum.password:
        return 'password';
      case PreferencesEnum.avatar:
        return 'avatar';
      case PreferencesEnum.token:
        return 'token';
      case PreferencesEnum.permission:
        return 'permission';

      case PreferencesEnum.userId:
        return 'userId';
      case PreferencesEnum.userFullName:
        return 'userFullName';
      case PreferencesEnum.companyName:
        return 'companyName';

      case PreferencesEnum.sellerCode:
        return 'sellerCode';

      case PreferencesEnum.authTokenLegacy:
        return 'authTokenLegacy';
      case PreferencesEnum.apiUrl:
        return 'apiUrl';
    }
  }
}
