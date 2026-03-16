import 'package:dematec_mobile/model/product_stored_model.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductStoredCardWidget extends StatefulWidget {
  final ProductStoredModel product;

  const ProductStoredCardWidget({super.key, required this.product});

  @override
  State<ProductStoredCardWidget> createState() =>
      _ProductStoredCardWidgetState();
}

class _ProductStoredCardWidgetState extends State<ProductStoredCardWidget> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: DematecUiColorsConstants.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DematecUiColorsConstants.neutral300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Alteração aqui: Envolvemos o texto e a bolinha em uma Row dentro do Expanded
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DematecUiLabelSmall(
                        text:
                            '${widget.product.idProduct} - ${widget.product.productDescription}',
                        fontWeight: FontWeight.w700,
                        color: DematecUiColorsConstants
                            .neutral800, // Cor padrão restaurada
                      ),
                    ),

                    // Se for inativo, desenha a bolinha vermelha!
                    if (widget.product.isProductInactive) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: DematecUiColorsConstants.error500,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'I',
                          style: TextStyle(
                            color: DematecUiColorsConstants.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                PhosphorIconsRegular.handTap,
                size: 20,
                color: DematecUiColorsConstants.neutral400,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Placeholder da Imagem
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: DematecUiColorsConstants.neutral100,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: DematecUiColorsConstants.neutral200,
                  ),
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
                    _buildInfoRow(
                      PhosphorIconsRegular.package,
                      'PACOTE ${widget.product.packQuantity?.toStringAsFixed(0) ?? 'N/A'}',
                    ),
                    const SizedBox(height: 4),
                    _buildInfoRow(
                      PhosphorIconsRegular.barcode,
                      widget.product.ean13Code ??
                          widget.product.reference ??
                          'Sem código',
                    ),
                    const SizedBox(height: 4),
                    _buildInfoRow(
                      PhosphorIconsRegular.boxArrowDown,
                      '${widget.product.onHandQuantity?.toStringAsFixed(2) ?? '0.00'} UNID',
                    ),
                  ],
                ),
              ),

              // O Botão de Expandir (Chevron)
              InkWell(
                onTap: _toggleExpand,
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: _isExpanded
                        ? DematecUiColorsConstants.neutral100
                        : DematecUiColorsConstants.neutral50,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: DematecUiColorsConstants.neutral200,
                    ),
                  ),
                  child: Icon(
                    // Troca o ícone dependendo do estado!
                    _isExpanded
                        ? PhosphorIconsRegular.caretUp
                        : PhosphorIconsRegular.caretDown,
                    size: 20,
                    color: DematecUiColorsConstants.neutral500,
                  ),
                ),
              ),
            ],
          ),

          // --- PARTE 2: A MÁGICA DA ANIMAÇÃO (CONTEÚDO EXTRA) ---
          AnimatedSize(
            duration: const Duration(milliseconds: 300), // Tempo da animação
            curve: Curves.easeInOut, // Curva suave
            child: _isExpanded
                ? _buildExpandedContent() // Se verdadeiro, desenha os detalhes
                : const SizedBox.shrink(), // Se falso, não ocupa nenhum espaço na tela
          ),
        ],
      ),
    );
  }

  // --- WIDGETS AUXILIARES ---

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Divider(color: DematecUiColorsConstants.neutral200, height: 1),
        ),

        // Detalhes extras vindos da API
        _buildExtraDetailRow(
          'Grupo:',
          widget.product.productGroupDescription ?? 'Não informado',
        ),
        const SizedBox(height: 4),
        _buildExtraDetailRow(
          'Subgrupo:',
          widget.product.productSubgroupDescription ?? 'Não informado',
        ),
        const SizedBox(height: 4),
        _buildExtraDetailRow(
          'Fornecedor:',
          widget.product.supplierName ?? 'Não informado',
        ),
        const SizedBox(height: 4),
        _buildExtraDetailRow(
          'NCM:',
          widget.product.ncmNumber ?? 'Não informado',
        ),
        const SizedBox(height: 4),
        _buildExtraDetailRow(
          'Peso:',
          'Líq: ${widget.product.netWeight ?? 0}kg / Bruto: ${widget.product.grossWeight ?? 0}kg',
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: DematecUiColorsConstants.neutral600),
        const SizedBox(width: 6),
        Expanded(
          child: DematecUiLabelSmall(
            text: text,
            color: DematecUiColorsConstants.neutral700,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildExtraDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80, // Largura fixa para deixar os textos alinhadinhos
          child: DematecUiLabelSmall(
            text: label,
            color: DematecUiColorsConstants.neutral500,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: DematecUiLabelSmall(
            text: value,
            color: DematecUiColorsConstants.neutral700,
          ),
        ),
      ],
    );
  }
}
