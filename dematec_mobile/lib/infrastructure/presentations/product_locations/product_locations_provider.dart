import 'package:dematec_mobile/core/enum/general/status_screen_enum.dart';
import 'package:dematec_mobile/model/product_with_locations_model.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service.dart';
import 'package:flutter/material.dart';

class ProductLocationsProvider extends ChangeNotifier {
  final ProductsLocationsService _productsLocationsService;

  ProductLocationsProvider(this._productsLocationsService) {
    _init();
  }

  StatusScreenEnum _statusScreen = StatusScreenEnum.initial;
  StatusScreenEnum get statusScreen => _statusScreen;

  ProductWithLocationsModel? _productWithLocations;
  ProductWithLocationsModel? get locations => _productWithLocations;

  Future<void> _init() async {}

  Future<void> loadLocationsForProduct(int idProduct) async {
    _statusScreen = StatusScreenEnum.loading;
    notifyListeners();

    final result = await _productsLocationsService.getProductLocations(
      idProduct: idProduct,
    );

    result.fold(
      (error) {
        _statusScreen = StatusScreenEnum.error;
        notifyListeners();
      },
      (successData) {
        _productWithLocations = successData;
        _statusScreen = StatusScreenEnum.success;
        notifyListeners();
      },
    );
  }

  void clearSearch() {
    _statusScreen = StatusScreenEnum.initial;
    _productWithLocations = null;
    notifyListeners();
  }
}
