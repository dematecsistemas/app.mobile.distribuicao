import 'dart:convert';

class ProductResponse {
  final int idProduct;
  final String productDescription;
  final String baseUoM;
  final bool isProductInactive;
  final String ean13Code;
  final double grossWeight;
  final double netWeight;
  final double height;
  final double width;
  final double length;
  final int idProductGroup;
  final String productGroupDescription;
  final int idProductSubgroup;
  final String productSubgroupDescription;

  ProductResponse({
    required this.idProduct,
    required this.productDescription,
    required this.baseUoM,
    required this.isProductInactive,
    required this.ean13Code,
    required this.grossWeight,
    required this.netWeight,
    required this.height,
    required this.width,
    required this.length,
    required this.idProductGroup,
    required this.productGroupDescription,
    required this.idProductSubgroup,
    required this.productSubgroupDescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idProduct': idProduct,
      'productDescription': productDescription,
      'baseUoM': baseUoM,
      'isProductInactive': isProductInactive,
      'ean13Code': ean13Code,
      'grossWeight': grossWeight,
      'netWeight': netWeight,
      'height': height,
      'width': width,
      'length': length,
      'idProductGroup': idProductGroup,
      'productGroupDescription': productGroupDescription,
      'idProductSubgroup': idProductSubgroup,
      'productSubgroupDescription': productSubgroupDescription,
    };
  }

  factory ProductResponse.fromMap(Map<String, dynamic> map) {
    return ProductResponse(
      idProduct: map['idProduct'] as int,
      productDescription: map['productDescription'] as String? ?? '',
      baseUoM: map['baseUoM'] as String? ?? '',
      isProductInactive: map['isProductInactive'] as bool? ?? false,
      ean13Code: map['ean13Code'] as String? ?? '',
      grossWeight: (map['grossWeight'] as num?)?.toDouble() ?? 0.0,
      netWeight: (map['netWeight'] as num?)?.toDouble() ?? 0.0,
      height: (map['height'] as num?)?.toDouble() ?? 0.0,
      width: (map['width'] as num?)?.toDouble() ?? 0.0,
      length: (map['length'] as num?)?.toDouble() ?? 0.0,
      idProductGroup: map['idProductGroup'] as int? ?? 0,
      productGroupDescription: map['productGroupDescription'] as String? ?? '',
      idProductSubgroup: map['idProductSubgroup'] as int? ?? 0,
      productSubgroupDescription:
          map['productSubgroupDescription'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromJson(String source) =>
      ProductResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
