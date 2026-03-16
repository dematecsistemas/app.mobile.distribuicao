import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';
import '../../../../core/enums/dematec_ui_size_widget.dart';
import '../../../../core/enums/text/dematec_ui_hiperlink_text_type_widget_enum.dart';

class HiperlinkTextWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final DematecUiSizeWidget? size;
  final DematecUiHiperlinkTextType type;
  final bool disabled;
  final bool visited;
  final bool showIconLeft;
  final bool showIconRight;

  const HiperlinkTextWidget(
    this.text,
    this.onTap, {
    super.key,
    this.size,
    this.type = DematecUiHiperlinkTextType.standalone,
    this.disabled = false,
    this.visited = false,
    this.showIconLeft = true,
    this.showIconRight = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = textColor(context);

    return InkWell(
      onTap: disabled ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: type == DematecUiHiperlinkTextType.allBorder
              ? Border.all(color: color, width: 2)
              : null,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            showIconLeft
                ? Center(
                    child: Icon(Icons.link, size: textSize, color: color),
                  )
                : Container(),
            Text(
              text,
              style: TextStyle(
                color: color,
                decoration: type == DematecUiHiperlinkTextType.inline
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: color,
                fontSize: textSize,
              ),
            ),
            showIconRight
                ? Center(
                    child: Icon(
                      Icons.file_download_outlined,
                      size: textSize,
                      color: color,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  double? get textSize {
    switch (size) {
      case DematecUiSizeWidget.large:
        return 40;
      case DematecUiSizeWidget.medium:
        return 36;
      case DematecUiSizeWidget.small:
        return 20;
      default:
        return null;
    }
  }

  Color textColor(BuildContext context) {
    if (disabled) return DematecUiColorsConstants.neutral200;

    if (visited) return DematecUiColorsConstants.primary800;

    return DematecUiColorsConstants.surface500;
  }
}
