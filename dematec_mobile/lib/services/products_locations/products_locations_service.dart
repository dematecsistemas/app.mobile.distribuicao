import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/model/location_with_product_stored_model.dart';
import 'package:dematec_mobile/model/product_with_locations_model.dart';

abstract class ProductsLocationsService {
  Future<Either<ApiException, LocationWithProductStoredModel>>
  getAllProductsStoredByLocationId(int locationId);

  Future<Either<ApiException, ProductWithLocationsModel>> getProductLocations({
    int? idProduct,
    String? eanCode,
    String? reference,
  });
}
