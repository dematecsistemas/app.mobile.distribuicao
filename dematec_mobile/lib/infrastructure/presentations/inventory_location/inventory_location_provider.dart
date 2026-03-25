import 'package:dematec_mobile/model/location_model.dart';
import 'package:dematec_mobile/model/product_model.dart';
import 'package:dematec_mobile/services/inventory_location/inventory_location_service.dart';
import 'package:flutter/material.dart';

class InventoryLocationProvider extends ChangeNotifier {
  final InventoryLocationService _inventoryLocationService;

  InventoryLocationProvider(this._inventoryLocationService) {
    _init();
  }

  LocationModel? _selectedLocation;
  LocationModel? get selectedLocation => _selectedLocation;

  ProductModel? _selectedProduct;
  ProductModel? get selectedProduct => _selectedProduct;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool get canLink => _selectedLocation != null && _selectedProduct != null;

  void setLocation(LocationModel location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void clearLocation() {
    _selectedLocation = null;
    _errorMessage = '';
    notifyListeners();
  }

  void setProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void clearProduct() {
    _selectedProduct = null;
    _errorMessage = '';
    notifyListeners();
  }

  Future<void> _init() async {}

  Future<bool> linkProductToLocation() async {
    if (!canLink || _isLoading) return false;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await _inventoryLocationService.linkProductToLocation(
      productId: _selectedProduct!.idProduct,
      locationId: _selectedLocation!.idLocation,
    );

    bool isSuccess = false;

    result.fold(
      (error) {
        _errorMessage = error.message;
        isSuccess = false;
      },
      (_) {
        // _selectedLocation = null;
        _selectedProduct = null;
        isSuccess = true;
      },
    );

    _isLoading = false;
    notifyListeners();

    return isSuccess;
  }
}
