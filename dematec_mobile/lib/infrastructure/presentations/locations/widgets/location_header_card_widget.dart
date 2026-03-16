import 'package:dematec_mobile/model/location_with_product_stored_model.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LocationHeaderCardWidget extends StatelessWidget {
  final LocationWithProductStoredModel location;

  const LocationHeaderCardWidget({super.key, required this.location});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DematecUiLabelMedium(
                  text: '${location.idLocation} - ${location.locationName}',
                  // fontWeight: FontWeight.w700,
                ),
              ),
              // Tag de Ativo/Inativo
              _buildStatusBadge(location.isActive),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconTextInfo(
                PhosphorIconsRegular.roadHorizon,
                'Rua: ${location.aisle}',
              ),
              _buildIconTextInfo(
                PhosphorIconsRegular.building,
                'Prédio: ${location.building}',
              ),
              _buildIconTextInfo(
                PhosphorIconsRegular.rows,
                'Nível: ${location.level}',
              ),
              _buildIconTextInfo(
                PhosphorIconsRegular.cube,
                'Apart.: ${location.bin}',
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: DematecUiColorsConstants.neutral200,
              height: 1,
            ),
          ),

          // 3. REGRAS OPERACIONAIS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRuleText(
                'Permite Movimentação',
                location.allowsStockMovement,
                PhosphorIconsRegular.arrowsLeftRight,
              ),
              const SizedBox(height: 4),
              _buildRuleText(
                'Permite Ressuprimento',
                location.allowsReplenishment,
                PhosphorIconsRegular.boxArrowDown,
              ),
              const SizedBox(height: 4),
              _buildRuleText(
                'Endereço de Picking',
                location.isPickingLocation,
                PhosphorIconsRegular.handGrabbing,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconTextInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: DematecUiColorsConstants.neutral500),
        const SizedBox(width: 4),
        DematecUiLabelSmall(
          text: text,
          color: DematecUiColorsConstants.neutral600,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  Widget _buildRuleText(String label, String value, IconData icon) {
    final bool isYes = value.toUpperCase() == 'S';

    return Row(
      children: [
        Icon(icon, size: 16, color: DematecUiColorsConstants.neutral400),
        const SizedBox(width: 6),
        DematecUiLabelSmall(
          text: '$label: ',
          color: DematecUiColorsConstants.neutral500,
        ),
        DematecUiLabelSmall(
          text: isYes ? 'Sim' : 'Não',
          color: isYes
              ? DematecUiColorsConstants.surfaceVariant500
              : DematecUiColorsConstants.error500,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String isActive) {
    final bool active =
        isActive.toUpperCase() == 'S' || isActive.toUpperCase() == 'TRUE';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: active
            ? DematecUiColorsConstants.surfaceVariant500.withOpacity(0.1)
            : DematecUiColorsConstants.error500.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DematecUiLabelSmall(
        text: active ? 'ATIVO' : 'INATIVO',
        color: active
            ? DematecUiColorsConstants.surfaceVariant500
            : DematecUiColorsConstants.error500,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
