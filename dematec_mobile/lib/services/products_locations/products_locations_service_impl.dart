import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/model/location_with_product_stored_model.dart';
import 'package:dematec_mobile/model/product_with_locations_model.dart';
import 'package:dematec_mobile/repositories/products_locations/products_locations_repository.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service.dart';

class ProductsLocationsServiceImpl implements ProductsLocationsService {
  final ProductsLocationsRepository _productsLocationsRepository;

  ProductsLocationsServiceImpl(this._productsLocationsRepository);

  @override
  Future<Either<ApiException, LocationWithProductStoredModel>>
  getAllProductsStoredByLocationId(int locationId) async {
    final result = await _productsLocationsRepository
        .getAllProductsStoredByLocationId(locationId);

    return result.fold(
      (error) {
        return Left(error);
      },
      (locationWithProduct) {
        final locationWithProductsModel = locationWithProduct.toModel();
        return Right(locationWithProductsModel);
      },
    );
  }

  @override
  Future<Either<ApiException, ProductWithLocationsModel>> getProductLocations({
    int? idProduct,
    String? eanCode,
    String? reference,
  }) async {
    final result = await _productsLocationsRepository.getProductLocations(
      idProduct: idProduct,
      eanCode: eanCode,
      reference: reference,
    );

    return result.fold(
      (error) {
        return Left(error);
      },
      (productWithLocationResponse) {
        final productModel = productWithLocationResponse.toModel();
        return Right(productModel);
      },
    );
  }
}
