import 'package:dematec_mobile/model/product_location_model.dart';
import 'package:dematec_mobile/utils/util.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StorageLocationCardWidget extends StatelessWidget {
  final ProductLocationModel location;

  const StorageLocationCardWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    // Se o saldo for 0, deixamos o card mais opaco para indicar que está vazio
    final bool isEmpty = (location.onHandQuantity ?? 0) <= 0;

    return Opacity(
      opacity: isEmpty ? 0.6 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: DematecUiColorsConstants.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isEmpty
                ? DematecUiColorsConstants.neutral200
                : DematecUiColorsConstants.neutral300,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ícone do Endereço
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: DematecUiColorsConstants.neutral50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                PhosphorIconsRegular.mapPin,
                color: DematecUiColorsConstants.neutral500,
              ),
            ),
            const SizedBox(width: 12),

            // Detalhes do Endereço
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DematecUiLabelMedium(
                    text: location.locationName,
                    fontWeight: FontWeight.w700,
                    color: DematecUiColorsConstants.neutral800,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildMiniTag('P: ${location.building}'),
                      const SizedBox(width: 6),
                      _buildMiniTag('C: ${location.aisle}'),
                      const SizedBox(width: 6),
                      _buildMiniTag('N: ${location.level}'),
                      const SizedBox(width: 6),
                      _buildMiniTag('V: ${location.bin}'),
                    ],
                  ),
                ],
              ),
            ),

            // Saldo (Destaque Principal)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const DematecUiLabelSmall(
                  text: 'Saldo',
                  color: DematecUiColorsConstants.neutral500,
                ),
                Text(
                  Util.formatQuantity(location.onHandQuantity),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isEmpty
                        ? DematecUiColorsConstants.neutral400
                        : DematecUiColorsConstants.primary500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: DematecUiColorsConstants.neutral100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: DematecUiColorsConstants.neutral600,
        ),
      ),
    );
  }
}
