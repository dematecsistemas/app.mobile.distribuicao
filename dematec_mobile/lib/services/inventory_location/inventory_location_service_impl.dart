import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/repositories/inventory_location/inventory_location_repository.dart';
import 'package:dematec_mobile/services/inventory_location/inventory_location_service.dart';

class InventoryLocationServiceImpl implements InventoryLocationService {
  final InventoryLocationRepository _inventoryLocationRepository;

  InventoryLocationServiceImpl(this._inventoryLocationRepository);

  @override
  Future<Either<ApiException, Unit>> linkProductToLocation({
    required int productId,
    required int locationId,
  }) async {
    return await _inventoryLocationRepository.linkProductToLocation(
      productId: productId,
      locationId: locationId,
    );
  }
}
