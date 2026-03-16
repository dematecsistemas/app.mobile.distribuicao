import 'package:dartz/dartz.dart';
import 'package:dematec_mobile/core/exceptions/api_exception.dart';
import 'package:dematec_mobile/model/paginated_model.dart';
import 'package:dematec_mobile/model/product_model.dart';
import 'package:dematec_mobile/repositories/product_search/product_search_repository.dart';
import 'package:dematec_mobile/services/product_search/product_search_service.dart';

class ProductSearchServiceImpl implements ProductSearchService {
  final ProductSearchRepository _productSearchRepository;

  ProductSearchServiceImpl(this._productSearchRepository);

  @override
  Future<Either<ApiException, PaginatedModel<ProductModel>>> searchProduct(
    int page,
    String query,
  ) async {
    final result = await _productSearchRepository.searchProduct(page, query);

    return result.map((responsePaginated) {
      final mappedData = responsePaginated.data
          .map((item) => ProductModel.fromResponse(item))
          .toList();

      return PaginatedModel<ProductModel>(
        page: responsePaginated.page,
        pageSize: responsePaginated.pageSize,
        data: mappedData,
      );
    });
  }
}
