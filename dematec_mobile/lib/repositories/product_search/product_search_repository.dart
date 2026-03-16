import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/dtos/response/paginated_response.dart';
import 'package:dematec_mobile/dtos/response/product_response.dart';

abstract class ProductSearchRepository {
  Future<Either<ApiException, PaginatedResponse<ProductResponse>>>
  searchProduct(int page, String query);
}
