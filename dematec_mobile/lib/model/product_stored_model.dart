class ProductStoredModel {
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

  ProductStoredModel({
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
}
