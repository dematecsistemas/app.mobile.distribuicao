import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/constants/endpoints/api_search_product_constants.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/dtos/response/paginated_response.dart';
import 'package:dematec_mobile/dtos/response/product_response.dart';
import 'package:dematec_mobile/repositories/product_search/product_search_repository.dart';

class ProductSearchRepositoryImpl implements ProductSearchRepository {
  final ApiClient _apiClient;

  ProductSearchRepositoryImpl(this._apiClient);

  @override
  Future<Either<ApiException, PaginatedResponse<ProductResponse>>>
  searchProduct(int page, String query) {
    return _apiClient.get(
      ApiSearchProductConstants.searchProduct,
      queryParameters: {'page': page, 'pageSize': 20, 'q': query},
      fromJson: (json) {
        return PaginatedResponse<ProductResponse>.fromJson(
          json,
          ProductResponse.fromMap,
        );
      },
    );
  }
}
