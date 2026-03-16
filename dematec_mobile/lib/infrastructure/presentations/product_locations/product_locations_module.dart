import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/infrastructure/presentations/product_locations/product_locations_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/product_locations/product_locations_view.dart';
import 'package:dematec_mobile/repositories/product_search/product_search_repository.dart';
import 'package:dematec_mobile/repositories/product_search/product_search_repository_impl.dart';
import 'package:dematec_mobile/repositories/products_locations/products_locations_repository.dart';
import 'package:dematec_mobile/repositories/products_locations/products_locations_repository_impl.dart';
import 'package:dematec_mobile/services/product_search/product_search_service.dart';
import 'package:dematec_mobile/services/product_search/product_search_service_impl.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductLocationsModule extends StatelessWidget {
  const ProductLocationsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductsLocationsRepository>(
          create: (context) =>
              ProductsLocationsRepositoryImpl(context.read<ApiClient>()),
        ),

        Provider<ProductsLocationsService>(
          create: (context) => ProductsLocationsServiceImpl(
            context.read<ProductsLocationsRepository>(),
          ),
        ),

        Provider<ProductSearchRepository>(
          create: (context) =>
              ProductSearchRepositoryImpl(context.read<ApiClient>()),
        ),

        Provider<ProductSearchService>(
          create: (context) =>
              ProductSearchServiceImpl(context.read<ProductSearchRepository>()),
        ),

        ChangeNotifierProvider<ProductLocationsProvider>(
          create: (context) => ProductLocationsProvider(
            context.read<ProductsLocationsService>(),
          ),
        ),
      ],
      child: const ProductLocationsView(),
    );
  }
}
