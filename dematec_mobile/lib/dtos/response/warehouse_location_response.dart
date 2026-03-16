import 'dart:convert';
import 'package:dematec_mobile/model/location_model.dart';

class WarehouseLocationResponse {
  final int idLocation;
  final String locationName;
  final int aisle;
  final int building;
  final int level;
  final int bin;
  final String? isOccupied;
  final String? isActive;
  final String? isMovementAllowed;
  final String? isAllowReplenishment;
  final String? isPickingLocation;

  WarehouseLocationResponse({
    required this.idLocation,
    required this.locationName,
    required this.aisle,
    required this.building,
    required this.level,
    required this.bin,
    this.isOccupied,
    this.isActive,
    this.isMovementAllowed,
    this.isAllowReplenishment,
    this.isPickingLocation,
  });

  LocationModel toModel() {
    return LocationModel(
      idLocation: idLocation,
      locationName: locationName,
      aisle: aisle,
      building: building,
      level: level,
      bin: bin,
      isActive: isActive,
      isAllowReplenishment: isAllowReplenishment,
      isMovementAllowed: isMovementAllowed,
      isOccupied: isOccupied,
      isPickingLocation: isPickingLocation,
    );
  }

  factory WarehouseLocationResponse.fromMap(Map<String, dynamic> map) {
    return WarehouseLocationResponse(
      idLocation: map['idLocation'] as int,
      locationName: map['locationName'] as String,
      aisle: map['aisle'] as int,
      building: map['building'] as int,
      level: map['level'] as int,
      bin: map['bin'] as int,
      isOccupied: map['isOccupied'] != null
          ? map['isOccupied'] as String
          : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      isMovementAllowed: map['isMovementAllowed'] != null
          ? map['isMovementAllowed'] as String
          : null,
      isAllowReplenishment: map['isAllowReplenishment'] != null
          ? map['isAllowReplenishment'] as String
          : null,
      isPickingLocation: map['isPickingLocation'] != null
          ? map['isPickingLocation'] as String
          : null,
    );
  }

  factory WarehouseLocationResponse.fromJson(String source) =>
      WarehouseLocationResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idLocation': idLocation,
      'locationName': locationName,
      'aisle': aisle,
      'building': building,
      'level': level,
      'bin': bin,
      'isOccupied': isOccupied,
      'isActive': isActive,
      'isMovementAllowed': isMovementAllowed,
      'isAllowReplenishment': isAllowReplenishment,
      'isPickingLocation': isPickingLocation,
    };
  }

  String toJson() => json.encode(toMap());
}
