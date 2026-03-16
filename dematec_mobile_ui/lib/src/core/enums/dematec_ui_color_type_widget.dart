import 'package:flutter/material.dart';

enum DematecUiColorTypeWidget {
  info,
  success,
  danger,
  warning,
  neutral,
  none,
  normal,
}

extension DematecUiColorTypeWidgetExt on DematecUiColorTypeWidget {
  Color color(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case DematecUiColorTypeWidget.info:
        return colorScheme.surface;
      case DematecUiColorTypeWidget.success:
        return colorScheme.surfaceContainerHighest;
      case DematecUiColorTypeWidget.danger:
        return colorScheme.error;
      case DematecUiColorTypeWidget.warning:
        return colorScheme.inverseSurface;
      case DematecUiColorTypeWidget.neutral:
        return (colorScheme.tertiary as MaterialColor)[300]!;
      case DematecUiColorTypeWidget.none:
        return Colors.transparent;
      case DematecUiColorTypeWidget.normal:
        return Colors.black;
    }
  }

  IconData get icon {
    switch (this) {
      case DematecUiColorTypeWidget.info:
        return Icons.info_rounded;
      case DematecUiColorTypeWidget.success:
        return Icons.check_circle;
      case DematecUiColorTypeWidget.danger:
        return Icons.close;
      case DematecUiColorTypeWidget.warning:
        return Icons.warning;
      case DematecUiColorTypeWidget.neutral:
        return Icons.lightbulb;
      case DematecUiColorTypeWidget.none:
        return Icons.info_rounded;
      case DematecUiColorTypeWidget.normal:
        return Icons.lightbulb;
    }
  }
}
