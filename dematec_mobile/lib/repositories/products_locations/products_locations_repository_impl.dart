import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/constants/endpoints/api_locations_product_constants.dart';
import 'package:dematec_mobile/core/constants/endpoints/api_product_locations_constants.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/dtos/response/location_with_product_stored_response.dart';
import 'package:dematec_mobile/dtos/response/product_with_locations_response.dart';
import 'package:dematec_mobile/repositories/products_locations/products_locations_repository.dart';

class ProductsLocationsRepositoryImpl implements ProductsLocationsRepository {
  final ApiClient _apiClient;

  ProductsLocationsRepositoryImpl(this._apiClient);

  @override
  Future<Either<ApiException, LocationWithProductStoredResponse>>
  getAllProductsStoredByLocationId(int locationId) {
    return _apiClient.get(
      ApiLocationsProductConstants.getAllProductsStoredByLocationId(locationId),
      fromJson: (json) => LocationWithProductStoredResponse.fromMap(json),
    );
  }

  @override
  Future<Either<ApiException, ProductWithLocationsResponse>>
  getProductLocations({int? idProduct, String? eanCode, String? reference}) {
    return _apiClient.get(
      ApiProductLocationsConstants.getAllLocationsByProduct,
      queryParameters: {
        'idProduct': ?idProduct,
        'eanCode': ?eanCode,
        'reference': ?reference,
      },
      fromJson: (json) => ProductWithLocationsResponse.fromMap(json),
    );
  }
}
