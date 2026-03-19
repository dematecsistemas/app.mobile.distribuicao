import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:dematec_mobile/model/location_model.dart';

class LocationSearchCardWidget extends StatelessWidget {
  final LocationModel location;
  final VoidCallback? onTap;

  const LocationSearchCardWidget({
    super.key,
    required this.location,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: DematecUiColorsConstants.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: DematecUiColorsConstants.neutral200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- LINHA 1: ÍCONE, NOME E STATUS ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: DematecUiColorsConstants.neutral50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: DematecUiColorsConstants.neutral200,
                    ),
                  ),
                  child: Icon(
                    PhosphorIconsRegular.mapPinLine,
                    color: DematecUiColorsConstants.neutral600,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
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
                      DematecUiLabelSmall(
                        text: 'Cód: ${location.idLocation}',
                        color: DematecUiColorsConstants.neutral500,
                      ),
                    ],
                  ),
                ),
                _buildStatusBadge(),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(
              height: 1,
              color: DematecUiColorsConstants.neutral200,
            ),
            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildCoordinateChip('Prédio', location.building.toString()),
                _buildCoordinateChip('Rua', location.aisle.toString()),
                _buildCoordinateChip('Nível', location.level.toString()),
                _buildCoordinateChip('Vão', location.bin.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Cria as tags cinzas de coordenadas
  Widget _buildCoordinateChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: DematecUiColorsConstants.neutral100,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: DematecUiColorsConstants.neutral200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
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
    );
  }

  Widget _buildStatusBadge() {
    if (location.isActive == false) {
      return _badgeWidget(
        'INATIVO',
        DematecUiColorsConstants.error50,
        DematecUiColorsConstants.error600,
        DematecUiColorsConstants.error200,
      );
    }

    // Se estiver explicitamente ocupado
    if (location.isOccupied == true) {
      return _badgeWidget(
        'OCUPADO',
        DematecUiColorsConstants.inverseSurface300,
        DematecUiColorsConstants.inverseSurface400,
        DematecUiColorsConstants.inverseSurface500,
      );
    }

    // Se for ativo e não estiver ocupado (Livre)
    if (location.isActive == true && location.isOccupied == false) {
      return _badgeWidget(
        'LIVRE',
        DematecUiColorsConstants.surfaceVariant500,
        DematecUiColorsConstants.surfaceVariant600,
        DematecUiColorsConstants.surfaceVariant700,
      );
    }

    // Retorna vazio caso não venham as flags (null)
    return const SizedBox.shrink();
  }

  Widget _badgeWidget(
    String text,
    Color bgColor,
    Color textColor,
    Color borderColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
    );
  }
}
