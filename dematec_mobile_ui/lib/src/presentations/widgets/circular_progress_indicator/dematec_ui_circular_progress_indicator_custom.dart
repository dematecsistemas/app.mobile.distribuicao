import 'package:flutter/material.dart';
import 'dematec_ui_circular_progress_indicator_style.dart';

class DematecUiCircularProgressIndicator extends StatelessWidget {
  const DematecUiCircularProgressIndicator({
    super.key,
    this.color,
    this.size = 36.0,
    this.strokeWidth,
    this.value,
  });

  final Color? color;

  final double size;

  final double? strokeWidth;

  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth:
            strokeWidth ??
            DematecUiCircularProgressIndicatorStyle.defaultStrokeWidth,
        backgroundColor:
            DematecUiCircularProgressIndicatorStyle.backgroundColor(),
        valueColor: AlwaysStoppedAnimation<Color>(
          color ??
              DematecUiCircularProgressIndicatorStyle.defaultColor(context),
        ),
      ),
    );
  }
}
