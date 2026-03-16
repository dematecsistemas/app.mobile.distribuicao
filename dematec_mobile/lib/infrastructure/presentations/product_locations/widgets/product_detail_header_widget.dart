import 'package:dematec_mobile/model/product_with_locations_model.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductDetailHeaderWidget extends StatelessWidget {
  final ProductWithLocationsModel product;

  const ProductDetailHeaderWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DematecUiColorsConstants.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DematecUiColorsConstants.neutral300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- 1. CABEÇALHO (Título e Status) ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DematecUiLabelMedium(
                  text: '${product.idProduct} - ${product.productDescription}',
                  fontWeight: FontWeight.w700,
                  color: DematecUiColorsConstants.neutral800,
                ),
              ),
              if (product.isProductInactive) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: DematecUiColorsConstants.error50,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: DematecUiColorsConstants.error200,
                    ),
                  ),
                  child: const Text(
                    'INATIVO',
                    style: TextStyle(
                      color: DematecUiColorsConstants.error600,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              height: 1,
              color: DematecUiColorsConstants.neutral200,
            ),
          ),

          // --- 2. INFORMAÇÕES PRINCIPAIS (Imagem + EAN + Ref + Fornecedor) ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: DematecUiColorsConstants.neutral100,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: DematecUiColorsConstants.neutral200,
                  ),
                ),
                child: Center(
                  child: Icon(
                    PhosphorIconsRegular.image,
                    color: DematecUiColorsConstants.neutral400,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Dados
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(
                      icon: PhosphorIconsRegular.barcode,
                      'EAN: ',
                      product.ean13Code ?? 'Não informado',
                    ),
                    const SizedBox(height: 6),
                    _buildInfoRow(
                      icon: PhosphorIconsRegular.hash,
                      'Ref: ',
                      product.reference ?? 'Não informada',
                    ),
                    const SizedBox(height: 6),
                    _buildInfoRow(
                      icon: PhosphorIconsRegular.buildings,
                      'Forn: ',
                      product.supplierName ?? 'Não informado',
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: DematecUiColorsConstants.neutral50,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: DematecUiColorsConstants.neutral200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  // PhosphorIconsRegular.folders,
                  'Grupo: ',
                  product.productGroupDescription ?? 'N/A',
                ),
                const SizedBox(height: 6),
                _buildInfoRow(
                  // PhosphorIconsRegular.folderOpen,
                  'Subgrupo: ',
                  product.productSubgroupDescription ?? 'N/A',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Usamos Wrap para que os cards se ajustem automaticamente caso a tela seja pequena
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // _buildMetricCard(
              //   PhosphorIconsRegular.package,
              //   'Tipo',
              //   product.productType ?? 'N/A',
              // ),
              _buildMetricCard(
                PhosphorIconsRegular.boxArrowUp,
                'Nro. Volume',
                product.packQuantity?.toStringAsFixed(0) ?? '1',
              ),
              _buildMetricCard(
                PhosphorIconsRegular.scales,
                'P. Líquido',
                '${product.netWeight?.toStringAsFixed(2) ?? '0.00'} kg',
              ),
              _buildMetricCard(
                PhosphorIconsRegular.barbell,
                'P. Bruto',
                '${product.grossWeight?.toStringAsFixed(2) ?? '0.00'} kg',
              ),
              // TODO: COLOCAR ALTURA, LARGURA e COMPRIMENTO
              // _buildMetricCard(
              //   PhosphorIconsRegular.barbell,
              //   'Altura',
              //   '${product.?.toStringAsFixed(2) ?? '0.00'} kg',
              // ),
              if (product.ncmNumber != null)
                _buildMetricCard(
                  PhosphorIconsRegular.fileText,
                  'NCM',
                  product.ncmNumber!,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {IconData? icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null)
          Icon(icon, size: 16, color: DematecUiColorsConstants.neutral500),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(
                    color: DematecUiColorsConstants.neutral500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: DematecUiColorsConstants.neutral800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: DematecUiColorsConstants.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: DematecUiColorsConstants.neutral200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Faz o container abraçar o texto
        children: [
          Icon(icon, size: 14, color: DematecUiColorsConstants.neutral500),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: DematecUiColorsConstants.neutral500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: DematecUiColorsConstants.neutral800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
