class LocationModel {
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

  LocationModel({
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
}
