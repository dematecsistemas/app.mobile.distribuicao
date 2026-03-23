import 'package:dematec_mobile/core/model/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuStorageProvider extends ChangeNotifier {
  List<MenuItemModel> menuItems = [];

  MenuStorageProvider() {
    _init();
  }

  void _init() {
    menuItems = [
      MenuItemModel(
        title: 'Vincular Produtos',
        subtitle: 'Vincular produto à um endereço',
        // icon: PhosphorIconsRegular.mapPinArea,
        // iconColor: Colors.blue,
        route: '/inventory-location',
      ),
      MenuItemModel(
        title: 'Armazenar Produtos',
        subtitle: 'Armazenar produtos em um endereço',
        // icon: PhosphorIconsRegular.boxArrowDown,
        // iconColor: Colors.blue,
        route: '/product-locations',
      ),
    ];
    notifyListeners();
  }
}
