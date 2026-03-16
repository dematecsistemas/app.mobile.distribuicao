import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/dtos/response/location_with_product_stored_response.dart';
import 'package:dematec_mobile/dtos/response/product_with_locations_response.dart';

abstract class ProductsLocationsRepository {
  Future<Either<ApiException, LocationWithProductStoredResponse>>
  getAllProductsStoredByLocationId(int locationId);

  Future<Either<ApiException, ProductWithLocationsResponse>>
  getProductLocations({int? idProduct, String? eanCode, String? reference});
}
