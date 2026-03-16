import 'package:dematec_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dematec_mobile/core/enum/general/preferences_enum.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MenuUserOption {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Function(BuildContext context) onTap;

  MenuUserOption({
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });
}

class BottomSheetUserOptionsProvider extends ChangeNotifier {
  final PrefService _prefService;

  List<MenuUserOption> items = [];
  String userFullName = '';
  String companyName = '';
  String initialsName = '';
  int? sellerCode;

  BottomSheetUserOptionsProvider(this._prefService) {
    _init();
  }

  Future<void> _init() async {
    userFullName = _prefService.getPref(
      PreferencesEnum.userFullName,
      defaultValue: 'Usuário não encontrado',
    );
    companyName = _prefService.getPref(
      PreferencesEnum.companyName,
      defaultValue: 'Dematec',
    );

    final sellerStr = _prefService.getPref(PreferencesEnum.sellerCode);
    sellerCode = int.tryParse(sellerStr);

    initialsName = Util.getInitialsName(userFullName);

    items = [
      MenuUserOption(
        title: 'Sair',
        icon: PhosphorIconsRegular.signOut,
        iconColor: DematecUiColorsConstants.error700,
        onTap: (context) => _onSignOut(context),
      ),
    ];

    notifyListeners();
  }

  void _onSignOut(BuildContext context) {
    _prefService.remove(PreferencesEnum.username);
    _prefService.remove(PreferencesEnum.password);
    _prefService.removeToken();

    Navigator.pop(context);
    context.go('/auth');
  }
}
