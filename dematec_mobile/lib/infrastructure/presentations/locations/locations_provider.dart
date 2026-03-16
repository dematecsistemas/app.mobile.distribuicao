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

  LocationWithProductStoredModel? _locations;
  LocationWithProductStoredModel? get locations => _locations;

  TextEditingController searchInput = TextEditingController();
  String searchText = '';

  Future<void> _init() async {}

  Future<void> getLocationWithProducts() async {
    final int searchInputInt = int.tryParse(searchText) ?? 0;

    if (searchInputInt <= 0) {
      _statusScreen = StatusScreenEnum.initial;
      _locations = null;
      notifyListeners();
      return;
    }

    _statusScreen = StatusScreenEnum.loading;
    notifyListeners();

    final result = await _productsLocationsService
        .getAllProductsStoredByLocationId(searchInputInt);
 
    result.fold(
      (error) {
        _statusScreen = StatusScreenEnum.error;
        _locations = null;
        print('Erro na busca: ${error.message}');
      },
      (success) {
        _statusScreen = StatusScreenEnum.success;
        _locations = success;
      },
    );

    notifyListeners();
  }

  void onChangeSearchInput(String text) {
    searchText = text;

    // Se o texto ficou vazio (ex: usuário clicou no X do DematecUiSearchField)
    if (text.isEmpty) {
      _statusScreen = StatusScreenEnum.initial;
      _locations = null;
    }

    notifyListeners();
  }

  void onSearch() {
    getLocationWithProducts();
  }

  @override
  void dispose() {
    searchInput.dispose();
    super.dispose();
  }
}
