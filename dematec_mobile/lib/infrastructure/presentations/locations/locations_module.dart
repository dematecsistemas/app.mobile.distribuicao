import 'package:dematec_mobile/infrastructure/presentations/locations/locations_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/locations_view.dart';
import 'package:dematec_mobile/repositories/products_locations/products_locations_repository.dart';
import 'package:dematec_mobile/repositories/products_locations/products_locations_repository_impl.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service.dart';
import 'package:dematec_mobile/services/products_locations/products_locations_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dematec_mobile/core/network/api_client.dart';

class LocationsModule extends StatelessWidget {
  const LocationsModule({super.key});

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

        ChangeNotifierProvider<LocationsProvider>(
          create: (context) =>
              LocationsProvider(context.read<ProductsLocationsService>()),
        ),
      ],
      child: const LocationsView(),
    );
  }
}
