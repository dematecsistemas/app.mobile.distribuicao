import 'package:flutter/material.dart';

import '../../../../dematec_mobile_ui.dart';

class DematecUiStyleCheckBox {
  static ButtonStyle styleCheckbox(BuildContext context) => ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return DematecUiColorsConstants.surface500;
      } else if (states.contains(WidgetState.focused)) {
        return DematecUiColorsConstants.tertiary600;
      } else if (states.contains(WidgetState.pressed)) {
        return DematecUiColorsConstants.surface300;
      }
      return null;
    }),
  );
}
