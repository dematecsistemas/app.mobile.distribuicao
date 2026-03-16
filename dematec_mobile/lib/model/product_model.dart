import 'package:dematec_mobile/dtos/response/product_response.dart';

class ProductModel {
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

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      idProduct: json['idProduct'] ?? 0,
      productDescription: json['productDescription'] ?? '',
      baseUoM: json['baseUoM'] ?? '',
      isProductInactive: json['isProductInactive'] ?? false,
      ean13Code: json['ean13Code'] ?? '',
      grossWeight: (json['grossWeight'] as num?)?.toDouble() ?? 0.0,
      netWeight: (json['netWeight'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      length: (json['length'] as num?)?.toDouble() ?? 0.0,
      idProductGroup: json['idProductGroup'] ?? 0,
      productGroupDescription: json['productGroupDescription'] ?? '',
      idProductSubgroup: json['idProductSubgroup'] ?? 0,
      productSubgroupDescription: json['productSubgroupDescription'] ?? '',
    );
  }

  factory ProductModel.fromResponse(ProductResponse response) {
    return ProductModel(
      idProduct: response.idProduct,
      productDescription: response.productDescription,
      baseUoM: response.baseUoM,
      isProductInactive: response.isProductInactive,
      ean13Code: response.ean13Code,
      grossWeight: response.grossWeight,
      netWeight: response.netWeight,
      height: response.height,
      width: response.width,
      length: response.length,
      idProductGroup: response.idProductGroup,
      productGroupDescription: response.productGroupDescription,
      idProductSubgroup: response.idProductSubgroup,
      productSubgroupDescription: response.productSubgroupDescription,
    );
  }
}
