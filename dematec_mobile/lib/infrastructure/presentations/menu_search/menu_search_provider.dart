import 'package:dematec_mobile/core/model/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuSearchProvider extends ChangeNotifier {
  List<MenuItemModel> menuItems = [];

  MenuSearchProvider() {
    _init();
  }

  void _init() {
    menuItems = [
      MenuItemModel(
        title: 'Consulta por Endereço',
        subtitle: 'Consultar produtos vinculados ao endereço',
        // icon: PhosphorIconsRegular.mapPinArea,
        // iconColor: Colors.blue,
        route: '/locations',
      ),
      MenuItemModel(
        title: 'Consulta por Produto',
        subtitle: 'Consultar endereços vinculados ao produto',
        // icon: PhosphorIconsRegular.boxArrowDown,
        // iconColor: Colors.blue,
        route: '/product-locations',
      ),
    ];
    notifyListeners();
  }
}
