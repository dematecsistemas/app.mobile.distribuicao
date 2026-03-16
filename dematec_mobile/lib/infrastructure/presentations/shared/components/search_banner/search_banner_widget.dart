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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: DematecUiColorsConstants.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: DematecUiColorsConstants.primary500),
          boxShadow: [
            BoxShadow(
              color: DematecUiColorsConstants.neutral200.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: DematecUiColorsConstants.primary500, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DematecUiLabelMedium(
                    text: title,
                    fontWeight: FontWeight.w600,
                    color: DematecUiColorsConstants.primary500,
                  ),
                  const SizedBox(height: 4),
                  DematecUiLabelSmall(
                    text: subtitle,
                    color: DematecUiColorsConstants.neutral500,
                  ),
                ],
              ),
            ),
            Icon(
              PhosphorIconsRegular.caretRight,
              color: DematecUiColorsConstants.neutral400,
            ),
          ],
        ),
      ),
    );
  }
}
