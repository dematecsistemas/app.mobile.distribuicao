import 'package:dematec_mobile/core/model/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuItemModel> menuItems = [];

  MenuProvider() {
    _init();
  }

  void _init() {
    menuItems = [
      MenuItemModel(
        title: 'Logística',
        subtitle: 'Funcionalidades de logística',
        icon: PhosphorIconsRegular.truck,
        iconColor: Colors.blue,
        route: '/menu-logistic',
      ),
    ];
    notifyListeners();
  }
}
