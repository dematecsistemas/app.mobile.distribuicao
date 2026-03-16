import 'package:dematec_mobile/model/product_model.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductSimpleCardWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductSimpleCardWidget({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: DematecUiColorsConstants.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: DematecUiColorsConstants.neutral300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: DematecUiColorsConstants.neutral100,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: DematecUiColorsConstants.neutral200),
              ),
              child: Center(
                child: Icon(
                  PhosphorIconsRegular.image,
                  color: DematecUiColorsConstants.neutral400,
                  size: 24,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DematecUiLabelMedium(
                    text: product.productDescription,
                    fontWeight:
                        FontWeight.w700, // Um peso maior para destacar o nome
                    color: DematecUiColorsConstants.neutral800,
                  ),
                  const SizedBox(
                    height: 4,
                  ), // Espaço reduzido para agrupar as informações
                  // Código e EAN (do seu rascunho)
                  Row(
                    children: [
                      DematecUiLabelSmall(
                        text: 'Cód: ${product.idProduct}',
                        color: DematecUiColorsConstants.neutral500,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DematecUiLabelSmall(
                          text: 'EAN: ${product.ean13Code}',
                          color: DematecUiColorsConstants.neutral500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 3. ÍCONE DE AÇÃO (Opcional, mas dá uma ótima UX indicando que é clicável)
            Icon(
              PhosphorIconsRegular.caretRight,
              size: 20,
              color: DematecUiColorsConstants.neutral400,
            ),
          ],
        ),
      ),
    );
  }
}
