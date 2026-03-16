import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';

class DematecUiTextFieldStyle {
  static InputDecoration styleTextField(
    BuildContext context,
    DematecUiTextFieldStyleEnum styleField,
  ) {
    return InputDecoration(
      isDense: true,
      fillColor: DematecUiColorsConstants.white,
      filled: true,
      border: _border(Colors.transparent),
      enabledBorder: _border(Colors.transparent),
      focusedBorder: _borderFocused(Colors.transparent, context),
      contentPadding: EdgeInsets.zero,
    );
  }

  static InputBorder _border(Color borderColor) => const OutlineInputBorder(
    borderSide: BorderSide(width: 1.5, color: Colors.transparent),
  );

  static InputBorder _borderFocused(Color borderColor, BuildContext context) =>
      const OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: Colors.transparent),
      );
}
