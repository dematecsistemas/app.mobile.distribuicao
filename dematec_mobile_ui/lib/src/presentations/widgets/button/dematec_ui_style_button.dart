import 'package:flutter/material.dart';

import '../../../../dematec_mobile_ui.dart';

class DematecUiStyleButton {
  static ButtonStyle styleButton(
    Color backgroundColor,
    Color colorComponents,
    Color colorFocused,
    Color borderColor,
    BuildContext context,
  ) => ButtonStyle(
    elevation: WidgetStateProperty.resolveWith<double?>((
      Set<WidgetState> states,
    ) {
      return 0;
    }),
    padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry?>((
      Set<WidgetState> states,
    ) {
      return const EdgeInsets.symmetric(horizontal: 0);
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return DematecUiColorsConstants.tertiary100;
      } else {
        return backgroundColor;
      }
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return DematecUiColorsConstants.tertiary400;
      } else {
        return colorComponents;
      }
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.pressed)) {
        return colorFocused;
      }
      return null;
    }),
    side: WidgetStateProperty.resolveWith<BorderSide>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.pressed)) {
        return _border(borderColor, 3);
      } else if (states.contains(WidgetState.disabled)) {
        return _border(DematecUiColorsConstants.tertiary100, 1);
      }
      return _border(borderColor, 1);
    }),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );

  static BorderSide _border(Color color, double width) {
    return BorderSide(width: width, color: color);
  }
}
