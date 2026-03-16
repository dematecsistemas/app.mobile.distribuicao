import 'package:dematec_mobile/model/product_stored_model.dart';

class LocationWithProductStoredModel {
  final int idLocation;
  final String locationName;
  final int aisle;
  final int building;
  final int level;
  final int bin;
  final String isActive;
  final String allowsStockMovement;
  final String allowsReplenishment;
  final String isPickingLocation;
  final List<ProductStoredModel> storeProducts;

  LocationWithProductStoredModel({
    required this.idLocation,
    required this.locationName,
    required this.aisle,
    required this.building,
    required this.level,
    required this.bin,
    required this.isActive,
    required this.allowsStockMovement,
    required this.allowsReplenishment,
    required this.isPickingLocation,
    required this.storeProducts,
  });
}
