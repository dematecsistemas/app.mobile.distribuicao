import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/model/location_model.dart';

abstract class WarehouseLocationsService {
  Future<Either<ApiException, List<LocationModel>>> getAllLocations();
}
