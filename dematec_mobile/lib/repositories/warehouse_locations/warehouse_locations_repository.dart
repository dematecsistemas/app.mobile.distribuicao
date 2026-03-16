import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/dtos/response/warehouse_location_response.dart';

abstract class WarehouseLocationsRepository {
  Future<Either<ApiException, List<WarehouseLocationResponse>>>
  getAllLocations();
}
