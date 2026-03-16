import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/constants/endpoints/api_warehouse_locations_constants.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/dtos/response/warehouse_location_response.dart';
import 'package:dematec_mobile/repositories/warehouse_locations/warehouse_locations_repository.dart';

class WarehouseLocationsRepositoryImpl implements WarehouseLocationsRepository {
  final ApiClient _apiClient;

  WarehouseLocationsRepositoryImpl(this._apiClient);

  @override
  Future<Either<ApiException, List<WarehouseLocationResponse>>>
  getAllLocations() async {
    return await _apiClient.get(
      ApiWarehouseLocationsConstants.getAllLocations,
      fromJson: (json) {
        final lista = json as List<dynamic>;
        return lista
            .map((item) => WarehouseLocationResponse.fromMap(item))
            .toList();
      },
    );
  }
}
