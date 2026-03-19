import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/model/location_model.dart';
import 'package:dematec_mobile/repositories/warehouse_locations/warehouse_locations_repository.dart';
import 'package:dematec_mobile/services/warehouse_locations/warehouse_locations_service.dart';

class WarehouseLocationsServiceImpl implements WarehouseLocationsService {
  final WarehouseLocationsRepository _warehouseLocationRepository;

  WarehouseLocationsServiceImpl(this._warehouseLocationRepository);

  @override
  Future<Either<ApiException, List<LocationModel>>> getAllLocations() async {
    final result = await _warehouseLocationRepository.getAllLocations();

    return result.fold(
      (error) {
        return Left(error);
      },
      (warehouseLocationsResponse) {
        final warehouseLocationsModel = warehouseLocationsResponse
            .map((response) => response.toModel())
            .toList();

        return Right(warehouseLocationsModel);
      },
    );
  }

  @override
  Future<Either<ApiException, List<LocationModel>>> searchLocations(
    String query,
  ) async {
    final result = await _warehouseLocationRepository.searchLocations(query);

    return result.fold(
      (error) {
        return Left(error);
      },
      (locationsSearchResponse) {
        final locationModel = locationsSearchResponse
            .map((response) => response.toModel())
            .toList();

        return Right(locationModel);
      },
    );
  }
}
