// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dematec_mobile/model/location_model.dart';

class LocationsSearchResponse {
  final int idLocation;
  final String? locationName;
  final int? aisle;
  final int? building;
  final int? level;
  final int? bin;
  final bool? isOccupied;
  final String? isActive;
  final String? isMovementAllowed;
  final String? isAllowReplenishment;
  final String? isPickingLocation;

  LocationsSearchResponse({
    required this.idLocation,
    this.locationName,
    this.aisle,
    this.building,
    this.level,
    this.bin,
    this.isOccupied,
    this.isActive,
    this.isMovementAllowed,
    this.isAllowReplenishment,
    this.isPickingLocation,
  });

  LocationModel toModel() {
    return LocationModel(
      idLocation: idLocation,
      locationName: locationName ?? '',
      aisle: aisle ?? -1,
      building: building ?? -1,
      level: level ?? -1,
      bin: bin ?? -1,
      isActive: isActive,
      isAllowReplenishment: isAllowReplenishment,
      isMovementAllowed: isMovementAllowed,
      isPickingLocation: isPickingLocation,
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
      'isOccupied': isOccupied,
      'isActive': isActive,
      'isMovementAllowed': isMovementAllowed,
      'isAllowReplenishment': isAllowReplenishment,
      'isPickingLocation': isPickingLocation,
    };
  }

  factory LocationsSearchResponse.fromMap(Map<String, dynamic> map) {
    return LocationsSearchResponse(
      idLocation: map['idLocation'] as int,
      locationName: map['locationName'] != null
          ? map['locationName'] as String
          : null,
      aisle: map['aisle'] != null ? map['aisle'] as int : null,
      building: map['building'] != null ? map['building'] as int : null,
      level: map['level'] != null ? map['level'] as int : null,
      bin: map['bin'] != null ? map['bin'] as int : null,
      isOccupied: map['isOccupied'] != null ? map['isOccupied'] as bool : null,
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

  String toJson() => json.encode(toMap());

  factory LocationsSearchResponse.fromJson(String source) =>
      LocationsSearchResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
