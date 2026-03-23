import 'dart:convert';

class LinkProductToLocationRequest {
  final int idLocation;
  final int idProduct;

  LinkProductToLocationRequest({
    required this.idLocation,
    required this.idProduct,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'idLocation': idLocation, 'idProduct': idProduct};
  }

  String toJson() => json.encode(toMap());
}
