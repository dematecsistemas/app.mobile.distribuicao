import 'package:dematec_mobile/core/network/api_client.dart';
import 'package:dematec_mobile/infrastructure/presentations/inventory_location/inventory_location_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/inventory_location/inventory_location_view.dart';
import 'package:dematec_mobile/repositories/inventory_location/inventory_location_repository.dart';
import 'package:dematec_mobile/repositories/inventory_location/inventory_location_repository_impl.dart';
import 'package:dematec_mobile/repositories/product_search/product_search_repository.dart';
import 'package:dematec_mobile/repositories/product_search/product_search_repository_impl.dart';
import 'package:dematec_mobile/repositories/warehouse_locations/warehouse_locations_repository.dart';
import 'package:dematec_mobile/repositories/warehouse_locations/warehouse_locations_repository_impl.dart';
import 'package:dematec_mobile/services/inventory_location/inventory_location_service.dart';
import 'package:dematec_mobile/services/inventory_location/inventory_location_service_impl.dart';
import 'package:dematec_mobile/services/product_search/product_search_service.dart';
import 'package:dematec_mobile/services/product_search/product_search_service_impl.dart';
import 'package:dematec_mobile/services/warehouse_locations/warehouse_locations_service.dart';
import 'package:dematec_mobile/services/warehouse_locations/warehouse_locations_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryLocationModule extends StatelessWidget {
  const InventoryLocationModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WarehouseLocationsRepository>(
          create: (context) =>
              WarehouseLocationsRepositoryImpl(context.read<ApiClient>()),
        ),

        Provider<WarehouseLocationsService>(
          create: (context) => WarehouseLocationsServiceImpl(
            context.read<WarehouseLocationsRepository>(),
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

        Provider<InventoryLocationRepository>(
          create: (context) =>
              InventoryLocationRepositoryImpl(context.read<ApiClient>()),
        ),

        Provider<InventoryLocationService>(
          create: (context) => InventoryLocationServiceImpl(
            context.read<InventoryLocationRepository>(),
          ),
        ),

        ChangeNotifierProvider<InventoryLocationProvider>(
          create: (context) => InventoryLocationProvider(
            context.read<InventoryLocationService>(),
          ),
        ),
      ],
      child: const InventoryLocationView(),
    );
  }
}
