import 'package:dematec_mobile/infrastructure/presentations/auth/auth_view.dart';
import 'package:dematec_mobile/infrastructure/presentations/home/home_view.dart';
import 'package:dematec_mobile/infrastructure/presentations/inventory_location/inventory_location_module.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/locations_module.dart';
import 'package:dematec_mobile/infrastructure/presentations/menu/menu_view.dart';
import 'package:dematec_mobile/infrastructure/presentations/menu_search/menu_search_view.dart';
import 'package:dematec_mobile/infrastructure/presentations/menu_storage/menu_storage_view.dart';
import 'package:dematec_mobile/infrastructure/presentations/product_locations/product_locations_module.dart';
import 'package:dematec_mobile/infrastructure/presentations/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/splash',
  routes: [
    // MENU
    GoRoute(path: '/menu', builder: (context, state) => MenuView()),
    GoRoute(
      path: '/menu-search',
      builder: (context, state) => MenuSearchView(),
    ),
    GoRoute(
      path: '/menu-storage',
      builder: (context, state) => MenuStorageView(),
    ),

    // PAGES
    GoRoute(path: '/auth', builder: (context, state) => AuthView()),
    GoRoute(path: '/splash', builder: (context, state) => SplashView()),
    GoRoute(path: '/home', builder: (context, state) => HomeView()),
    GoRoute(path: '/locations', builder: (context, state) => LocationsModule()),
    GoRoute(
      path: '/product-locations',
      builder: (context, state) => ProductLocationsModule(),
    ),
    GoRoute(
      path: '/inventory-location',
      builder: (context, state) => InventoryLocationModule(),
    ),
  ],
);
