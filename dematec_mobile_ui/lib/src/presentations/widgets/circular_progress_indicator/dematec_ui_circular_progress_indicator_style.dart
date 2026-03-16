import 'package:flutter/material.dart';
import '../../../core/constants/mapping_colors.dart';

class DematecUiCircularProgressIndicatorStyle {
  static Color defaultColor(BuildContext context) {
    return DematecUiColorsConstants.primary500;
  }

  static Color backgroundColor() {
    return DematecUiColorsConstants.tertiary200;
  }

  static double get defaultStrokeWidth => 4.0;
}
