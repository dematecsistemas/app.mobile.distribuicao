import 'dart:convert';

import 'package:dematec_mobile/model/product_stored_model.dart';

class ProductStoredResponse {
  final String? reference;
  final int idProduct;
  final DateTime? createdDate;
  final double? onHandQuantity;
  final String productDescription;
  final int idProductGroup;
  final String? productGroupDescription;
  final int idProductSubgroup;
  final String? productSubgroupDescription;
  final int? idSupplier;
  final String? supplierName;
  final bool isProductInactive;
  final int idNcm;
  final String? ncmNumber;
  final double? minQuantity;
  final double? maxQuantity;
  final String? productType;
  final String? ean13Code;
  final double? grossWeight;
  final double? netWeight;
  final double? packQuantity;

  ProductStoredResponse({
    this.reference,
    required this.idProduct,
    this.createdDate,
    this.onHandQuantity,
    required this.productDescription,
    required this.idProductGroup,
    this.productGroupDescription,
    required this.idProductSubgroup,
    this.productSubgroupDescription,
    this.idSupplier,
    this.supplierName,
    required this.isProductInactive,
    required this.idNcm,
    this.ncmNumber,
    this.minQuantity,
    this.maxQuantity,
    this.productType,
    this.ean13Code,
    this.grossWeight,
    this.netWeight,
    this.packQuantity,
  });

  ProductStoredModel toModel() {
    return ProductStoredModel(
      idProduct: idProduct,
      productDescription: productDescription,
      idProductGroup: idProductGroup,
      idProductSubgroup: idProductSubgroup,
      isProductInactive: isProductInactive,
      idNcm: idNcm,
      createdDate: createdDate,
      ean13Code: ean13Code,
      grossWeight: grossWeight,
      idSupplier: idSupplier,
      maxQuantity: maxQuantity,
      minQuantity: minQuantity,
      ncmNumber: ncmNumber,
      netWeight: netWeight,
      onHandQuantity: onHandQuantity,
      packQuantity: packQuantity,
      productGroupDescription: productGroupDescription,
      productSubgroupDescription: productSubgroupDescription,
      productType: productType,
      reference: reference,
      supplierName: supplierName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reference': reference,
      'idProduct': idProduct,
      'createdDate': createdDate?.millisecondsSinceEpoch,
      'onHandQuantity': onHandQuantity,
      'productDescription': productDescription,
      'idProductGroup': idProductGroup,
      'productGroupDescription': productGroupDescription,
      'idProductSubgroup': idProductSubgroup,
      'productSubgroupDescription': productSubgroupDescription,
      'idSupplier': idSupplier,
      'supplierName': supplierName,
      'isProductInactive': isProductInactive,
      'idNcm': idNcm,
      'ncmNumber': ncmNumber,
      'minQuantity': minQuantity,
      'maxQuantity': maxQuantity,
      'productType': productType,
      'ean13Code': ean13Code,
      'grossWeight': grossWeight,
      'netWeight': netWeight,
      'packQuantity': packQuantity,
    };
  }

  factory ProductStoredResponse.fromMap(Map<String, dynamic> map) {
    return ProductStoredResponse(
      reference: map['reference'] != null ? map['reference'] as String : null,
      idProduct: map['idProduct'] as int,
      createdDate: map['createdDate'] != null
          ? DateTime.tryParse(map['createdDate'])
          : null,
      onHandQuantity: map['onHandQuantity'] != null
          ? map['onHandQuantity'] as double
          : null,
      productDescription: map['productDescription'] as String,
      idProductGroup: map['idProductGroup'] as int,
      productGroupDescription: map['productGroupDescription'] != null
          ? map['productGroupDescription'] as String
          : null,
      idProductSubgroup: map['idProductSubgroup'] as int,
      productSubgroupDescription: map['productSubgroupDescription'] != null
          ? map['productSubgroupDescription'] as String
          : null,
      idSupplier: map['idSupplier'] != null ? map['idSupplier'] as int : null,
      supplierName: map['supplierName'] != null
          ? map['supplierName'] as String
          : null,
      isProductInactive: map['isProductInactive'] as bool,
      idNcm: map['idNcm'] as int,
      ncmNumber: map['ncmNumber'] != null ? map['ncmNumber'] as String : null,
      minQuantity: map['minQuantity'] != null
          ? map['minQuantity'] as double
          : null,
      maxQuantity: map['maxQuantity'] != null
          ? map['maxQuantity'] as double
          : null,
      productType: map['productType'] != null
          ? map['productType'] as String
          : null,
      ean13Code: map['ean13Code'] != null ? map['ean13Code'] as String : null,
      grossWeight: map['grossWeight'] != null
          ? map['grossWeight'] as double
          : null,
      netWeight: map['netWeight'] != null ? map['netWeight'] as double : null,
      packQuantity: map['packQuantity'] != null
          ? map['packQuantity'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductStoredResponse.fromJson(String source) =>
      ProductStoredResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
