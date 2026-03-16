import 'dart:convert';
import 'package:dematec_mobile/dtos/response/product_stored_response.dart';
import 'package:dematec_mobile/model/location_with_product_stored_model.dart';

class LocationWithProductStoredResponse {
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
  final List<ProductStoredResponse> storeProducts;

  LocationWithProductStoredResponse({
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

  LocationWithProductStoredModel toModel() {
    return LocationWithProductStoredModel(
      idLocation: idLocation,
      locationName: locationName,
      aisle: aisle,
      building: building,
      level: level,
      bin: bin,
      isActive: isActive,
      allowsStockMovement: allowsStockMovement,
      allowsReplenishment: allowsReplenishment,
      isPickingLocation: isPickingLocation,
      storeProducts: storeProducts.map((e) => e.toModel()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idLocation': idLocation,
      'locationName': locationName,
      'aisle': aisle,
      'building': building,
      'level': level,
      'bin': bin,
      'isActive': isActive,
      'allowsStockMovement': allowsStockMovement,
      'allowsReplenishment': allowsReplenishment,
      'isPickingLocation': isPickingLocation,
      'storeProducts': storeProducts.map((x) => x.toMap()).toList(),
    };
  }

  factory LocationWithProductStoredResponse.fromMap(Map<String, dynamic> map) {
    return LocationWithProductStoredResponse(
      idLocation: map['idLocation'] as int,
      locationName: map['locationName'] as String,
      aisle: map['aisle'] as int,
      building: map['building'] as int,
      level: map['level'] as int,
      bin: map['bin'] as int,
      isActive: map['isActive'] as String,
      allowsStockMovement: map['allowsStockMovement'] as String,
      allowsReplenishment: map['allowsReplenishment'] as String,
      isPickingLocation: map['isPickingLocation'] as String,
      storeProducts: map['storeProducts'] != null
          ? (map['storeProducts'] as List<dynamic>)
                .map(
                  (item) => ProductStoredResponse.fromMap(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationWithProductStoredResponse.fromJson(String source) =>
      LocationWithProductStoredResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
