import 'package:dematec_mobile_ui/src/core/enums/dematec_ui_alignment_widget.dart';
import 'package:flutter/material.dart';

import '../../../../dematec_mobile_ui.dart';

class DematecUiButtonCustom extends StatelessWidget {
  const DematecUiButtonCustom({
    Key? key,
    this.title,
    this.size = DematecUiSizeWidget.medium,
    this.type = DematecUiTypeButtonWidget.normal,
    required this.onPressed,
    this.colorType = DematecUiColorTypeWidget.info,
    this.iconLeft,
    this.iconRight,
    this.alignmentComponents = DematecUiAlignmentWidget.center,
    this.mainAxisSize,
    this.colorTypeText,
    this.loading = false,
    this.disabled = false,
  }) : super(key: key);

  final String? title;
  final DematecUiSizeWidget size;
  final DematecUiTypeButtonWidget type;
  final Function()? onPressed;
  final DematecUiColorTypeWidget colorType;
  final DematecUiColorTypeWidget? colorTypeText;
  final IconData? iconLeft;
  final IconData? iconRight;
  final DematecUiAlignmentWidget alignmentComponents;
  final MainAxisSize? mainAxisSize;
  final bool loading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: DematecUiStyleButton.styleButton(
        getBackgroundColor(context),
        getColorComponents(context),
        getFocusedColor(context),
        getBorderColor(context),
        context,
      ),
      onPressed: () {
        if (!loading && onPressed != null && !disabled) {
          onPressed!();
        }
      },
      child: SizedBox(
        height: getSized(),
        child: Stack(
          children: [
            if (loading) ...[
              SizedBox(
                height: getSized(),
                child: LinearProgressIndicator(
                  color: getColorComponents(context).withAlpha(48),
                  borderRadius: BorderRadius.circular(12),
                  backgroundColor: getColorComponents(context).withAlpha(24),
                ),
              ),
            ],
            SizedBox(
              height: getSized(),
              child: Row(
                mainAxisAlignment: getAlignment(),
                mainAxisSize:
                    mainAxisSize ??
                    (title == null ? MainAxisSize.min : MainAxisSize.max),
                children: [
                  if (iconLeft != null) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                        left: title == null ? 8 : 0,
                      ),
                      child: Icon(
                        iconLeft,
                        color: getColorComponents(context),
                        size: getIconSize(),
                      ),
                    ),
                  ],
                  if (title != null) ...[
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getFontSize(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  if (iconRight != null) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: title == null ? 8 : 0,
                      ),
                      child: Icon(
                        iconRight,
                        color: getColorComponents(context),
                        size: getIconSize(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double? getSized() {
    switch (size) {
      case DematecUiSizeWidget.extraSmall:
        return 32;
      case DematecUiSizeWidget.small:
        return 36;
      case DematecUiSizeWidget.medium:
        return 40;
      case DematecUiSizeWidget.large:
        return 44;
      case DematecUiSizeWidget.extraLarge:
        return 48;
      case DematecUiSizeWidget.extraExtraLarge:
        return 62;
      default:
        return 32;
    }
  }

  double getFontSize() {
    switch (size) {
      case DematecUiSizeWidget.extraSmall:
        return 12;
      case DematecUiSizeWidget.small:
        return 14;
      case DematecUiSizeWidget.medium:
        return 16;
      case DematecUiSizeWidget.large:
        return 18;
      case DematecUiSizeWidget.extraLarge:
        return 20;
      default:
        return 12;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    if (type == DematecUiTypeButtonWidget.normal) {
      if (disabled) {
        return DematecUiColorsConstants.neutral300;
      }
      return colorType.color(context);
    } else {
      return Colors.transparent;
    }
  }

  Color getColorComponents(BuildContext context) {
    if (disabled) {
      return DematecUiColorsConstants.neutral400;
    }

    if (type == DematecUiTypeButtonWidget.normal) {
      if (colorType == DematecUiColorTypeWidget.neutral) {
        return (colorTypeText?.color(context) ?? Colors.grey);
      }
      return (colorTypeText?.color(context) ?? Colors.white);
    } else {
      return (colorTypeText ?? colorType).color(context);
    }
  }

  Color getFocusedColor(BuildContext context) {
    if (type == DematecUiTypeButtonWidget.normal) {
      if (disabled) {
        return DematecUiColorsConstants.neutral600;
      }

      switch (colorType) {
        case DematecUiColorTypeWidget.info:
          return (Theme.of(context).colorScheme.surface as MaterialColor)[700]!;
        case DematecUiColorTypeWidget.success:
          return (Theme.of(context).colorScheme.surfaceContainerHighest
              as MaterialColor)[700]!;
        case DematecUiColorTypeWidget.danger:
          return (Theme.of(context).colorScheme.error as MaterialColor)[700]!;
        case DematecUiColorTypeWidget.warning:
          return (Theme.of(context).colorScheme.inverseSurface
              as MaterialColor)[700]!;
        case DematecUiColorTypeWidget.neutral:
          return (Theme.of(context).colorScheme.surface as MaterialColor)[700]!;
        case DematecUiColorTypeWidget.none:
          return Colors.transparent;
        case DematecUiColorTypeWidget.normal:
          return Colors.black;
      }
    } else {
      return Colors.transparent;
    }
  }

  Color getBorderColor(BuildContext context) {
    if (type == DematecUiTypeButtonWidget.outline) {
      if (disabled) {
        return DematecUiColorsConstants.neutral300;
      }
      return colorType.color(context);
    } else {
      return Colors.transparent;
    }
  }

  double getIconSize() {
    if (size == DematecUiSizeWidget.large ||
        size == DematecUiSizeWidget.extraLarge) {
      return 24;
    } else {
      return 20;
    }
  }

  MainAxisAlignment getAlignment() {
    switch (alignmentComponents) {
      case DematecUiAlignmentWidget.left:
        return MainAxisAlignment.start;
      case DematecUiAlignmentWidget.center:
        return MainAxisAlignment.center;
      case DematecUiAlignmentWidget.right:
        return MainAxisAlignment.end;
    }
  }
}
