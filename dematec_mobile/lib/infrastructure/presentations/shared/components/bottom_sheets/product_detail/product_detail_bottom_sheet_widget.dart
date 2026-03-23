import 'package:dematec_mobile/model/product_stored_model.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductDetailBottomSheetWidget extends StatelessWidget {
  final ProductStoredModel product;

  const ProductDetailBottomSheetWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 24,
        top: 16,
        left: 24,
        right: 24,
      ),
      decoration: const BoxDecoration(
        color: DematecUiColorsConstants.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: DematecUiColorsConstants.neutral300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 24),

          DematecUiLabelMedium(
            text: '${product.idProduct} - ${product.productDescription}',
            fontWeight: FontWeight.w700,
            color: DematecUiColorsConstants.neutral800,
          ),

          const SizedBox(height: 24),

          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: DematecUiColorsConstants.neutral50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                PhosphorIconsRegular.image,
                size: 80,
                color: DematecUiColorsConstants.neutral300,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // LINHA DE CÓDIGO E QUANTIDADE (SpaceBetween para jogar um pra cada lado)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconText(
                PhosphorIconsRegular.barcode,
                product.ean13Code ?? 'Sem EAN',
                isLarge: true,
              ),
              _buildIconText(
                PhosphorIconsRegular
                    .boxArrowDown, // Ou PhosphorIconsRegular.cube
                '${product.packQuantity ?? 0}',
                isLarge: true,
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: DematecUiColorsConstants.neutral200,
              height: 1,
            ),
          ),

          // GRID DE DETALHES (Unidade, Cubicagem, Peso)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _buildDetailColumn(
                  'Unidade de Medida',
                  'UNIDADE - 1.0 Unidades', // Troque pela variável real
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _buildDetailColumn(
                  'Cubicagem',
                  'Alt. ${product.netWeight ?? 0} x Larg. ${product.grossWeight ?? 0} x Comp. ${product.grossWeight ?? 0} cm',
                ),
              ),
              Expanded(
                flex: 1,
                child: _buildDetailColumn(
                  'Peso',
                  '${product.netWeight ?? 0.0} kg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // WIDGETS AUXILIARES PARA DEIXAR O CÓDIGO LIMPO
  Widget _buildIconText(IconData icon, String text, {bool isLarge = false}) {
    return Row(
      children: [
        Icon(
          icon,
          size: isLarge ? 24 : 20,
          color: DematecUiColorsConstants.neutral700,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: isLarge ? 18 : 14,
            fontWeight: isLarge ? FontWeight.w600 : FontWeight.normal,
            color: DematecUiColorsConstants.neutral800,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DematecUiLabelSmall(
          text: title,
          color: DematecUiColorsConstants.neutral500,
        ),
        const SizedBox(height: 4),
        DematecUiLabelSmall(
          text: value,
          fontWeight: FontWeight.w600,
          color: DematecUiColorsConstants.neutral700,
        ),
      ],
    );
  }
}
