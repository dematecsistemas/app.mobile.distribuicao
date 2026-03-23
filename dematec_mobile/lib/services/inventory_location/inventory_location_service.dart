import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';

abstract class InventoryLocationService {
  Future<Either<ApiException, Unit>> linkProductToLocation({
    required int productId,
    required int locationId,
  });
}
