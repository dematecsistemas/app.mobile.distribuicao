import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchBannerWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const SearchBannerWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DematecUiColorsConstants.neutral200),
      ),
      // 2. Material transparente garante que o ripple effect (ondinha) do InkWell fique visível
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: DematecUiColorsConstants.primary100,
          highlightColor: DematecUiColorsConstants.primary100.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: DematecUiColorsConstants.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: DematecUiColorsConstants.neutral200,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: DematecUiColorsConstants.primary500,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DematecUiLabelMedium(
                        text: title,
                        fontWeight: FontWeight.w700,
                        color: DematecUiColorsConstants.neutral700,
                      ),
                      const SizedBox(height: 4),
                      DematecUiLabelSmall(
                        text: subtitle,
                        color: DematecUiColorsConstants.neutral600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  PhosphorIconsRegular.caretRight,
                  color: DematecUiColorsConstants.neutral400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
