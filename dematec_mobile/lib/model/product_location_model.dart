class ProductLocationModel {
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

  ProductLocationModel({
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
}
