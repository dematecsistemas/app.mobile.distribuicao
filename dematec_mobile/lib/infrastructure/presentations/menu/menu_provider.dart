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
        title: 'Consultas',
        subtitle: 'Consultas de produtos e endereços',
        icon: PhosphorIconsRegular.magnifyingGlass,
        iconColor: Colors.blue,
        route: '/menu-search',
      ),
      MenuItemModel(
        title: 'Armazenamentos',
        subtitle: 'Armazenamento de mercadorias',
        icon: PhosphorIconsRegular.garage,
        iconColor: Colors.blue,
        route: '/menu-storage',
      ),
    ];
    notifyListeners();
  }
}
