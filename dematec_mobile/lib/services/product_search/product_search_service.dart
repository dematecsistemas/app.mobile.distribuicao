import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/model/paginated_model.dart';
import 'package:dematec_mobile/model/product_model.dart';

abstract class ProductSearchService {
  Future<Either<ApiException, PaginatedModel<ProductModel>>> searchProduct(
    int page,
    String query,
  );
}
