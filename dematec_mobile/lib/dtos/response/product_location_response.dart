import 'dart:convert';
import 'package:dematec_mobile/model/product_location_model.dart';

class ProductLocationResponse {
  final int idLocation;
  final String locationName;
  final int aisle;
  final int building;
  final int level;
  final int bin;
  final String? isActive;
  final String? allowsStockMovement;
  final String? allowsReplenishment;
  final String? isPickingLocation;
  final DateTime? createdDate;
  final double? onHandQuantity;

  ProductLocationResponse({
    required this.idLocation,
    required this.locationName,
    required this.aisle,
    required this.building,
    required this.level,
    required this.bin,
    this.isActive,
    this.allowsStockMovement,
    this.allowsReplenishment,
    this.isPickingLocation,
    this.createdDate,
    this.onHandQuantity,
  });

  ProductLocationModel toModel() {
    return ProductLocationModel(
      idLocation: idLocation,
      locationName: locationName,
      aisle: aisle,
      building: building,
      level: level,
      bin: bin,
      allowsReplenishment: allowsReplenishment,
      allowsStockMovement: allowsStockMovement,
      isActive: isActive,
      createdDate: createdDate,
      isPickingLocation: isPickingLocation,
      onHandQuantity: onHandQuantity,
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
      'createdDate': createdDate?.toIso8601String(),
      'onHandQuantity': onHandQuantity,
    };
  }

  factory ProductLocationResponse.fromMap(Map<String, dynamic> map) {
    return ProductLocationResponse(
      idLocation: map['idLocation'] as int,
      locationName: map['locationName'] as String,
      aisle: map['aisle'] as int,
      building: map['building'] as int,
      level: map['level'] as int,
      bin: map['bin'] as int,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      allowsStockMovement: map['allowsStockMovement'] != null
          ? map['allowsStockMovement'] as String
          : null,
      allowsReplenishment: map['allowsReplenishment'] != null
          ? map['allowsReplenishment'] as String
          : null,
      isPickingLocation: map['isPickingLocation'] != null
          ? map['isPickingLocation'] as String
          : null,
      createdDate: map['createdDate'] != null
          ? DateTime.tryParse((map['createdDate']).toString())
          : null,
      onHandQuantity: map['onHandQuantity'] != null
          ? (map['onHandQuantity'] as num).toDouble()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductLocationResponse.fromJson(String source) =>
      ProductLocationResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
