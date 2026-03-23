import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/constants/endpoints/api_inventory_location_constants.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/dtos/request/link_product_to_location_request.dart';
import 'package:dematec_mobile/repositories/inventory_location/inventory_location_repository.dart';

class InventoryLocationRepositoryImpl implements InventoryLocationRepository {
  final ApiClient _apiClient;

  InventoryLocationRepositoryImpl(this._apiClient);

  @override
  Future<Either<ApiException, Unit>> linkProductToLocation({
    required int productId,
    required int locationId,
  }) async {
    final request = LinkProductToLocationRequest(
      idLocation: locationId,
      idProduct: productId,
    );

    return await _apiClient.post(
      ApiInventoryLocationConstants.linkProductToLocation,
      body: request.toMap(),
      fromJson: (json) {
        return unit;
      },
    );
  }
}
