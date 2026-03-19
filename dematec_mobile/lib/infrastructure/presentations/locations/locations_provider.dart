import 'package:dematec_mobile/core/enum/general/status_screen_enum.dart';
import 'package:dematec_mobile/model/location_with_product_stored_model.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service.dart';
import 'package:flutter/widgets.dart';

class LocationsProvider extends ChangeNotifier {
  final ProductsLocationsService _productsLocationsService;

  LocationsProvider(this._productsLocationsService) {
    _init();
  }

  StatusScreenEnum _statusScreen = StatusScreenEnum.initial;
  StatusScreenEnum get statusScreen => _statusScreen;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  LocationWithProductStoredModel? _locations;
  LocationWithProductStoredModel? get locations => _locations;

  Future<void> _init() async {}

  Future<void> loadProductsForLocation(int locationId) async {
    if (locationId <= 0) {
      _statusScreen = StatusScreenEnum.error;
      _locations = null;
      notifyListeners();
      return;
    }

    _statusScreen = StatusScreenEnum.loading;
    notifyListeners();

    final result = await _productsLocationsService
        .getAllProductsStoredByLocationId(locationId);

    result.fold(
      (error) {
        _statusScreen = StatusScreenEnum.error;
        _locations = null;
        _errorMessage = error.message;
        debugPrint('Erro na busca de produtos por endereço: ${error.message}');
      },
      (success) {
        _statusScreen = StatusScreenEnum.success;
        _locations = success;
        _errorMessage = '';
      },
    );

    notifyListeners();
  }

  void clearSearch() {
    _statusScreen = StatusScreenEnum.initial;
    _locations = null;
    notifyListeners();
  }
}
