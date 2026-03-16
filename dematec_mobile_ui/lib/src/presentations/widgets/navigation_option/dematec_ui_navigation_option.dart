import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';

class DematecUiNavigationOption extends StatelessWidget {
  const DematecUiNavigationOption({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.iconColor,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: UiPaddings.screenWithLegend,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Row(
                    children: [
                      Icon(
                        icon,
                        color: iconColor ?? DematecUiColorsConstants.primary400,
                        size: 28,
                      ),
                      const SizedBox(width: 16),
                    ],
                  )
                : SizedBox.shrink(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: DematecUiColorsConstants.neutral800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: DematecUiColorsConstants.neutral500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              color: DematecUiColorsConstants.neutral400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
