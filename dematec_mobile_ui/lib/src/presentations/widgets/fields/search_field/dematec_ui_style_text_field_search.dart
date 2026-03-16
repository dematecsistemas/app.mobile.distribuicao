import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:dematec_mobile_ui/src/presentations/widgets/more_options/dematec_ui_more_options.dart';
import 'package:dematec_mobile_ui/src/presentations/widgets/more_options/dematec_ui_more_options_item.dart';
import 'package:flutter/material.dart';

class DematecUiStyleTextFieldSearch {
  static InputDecoration styleTextFieldSearch(
    String hint,
    double sizeField,
    double sizeIcon,
    bool isEnabled,
    bool isOpen,
    Function() onTap,
    IconData iconData,
    BuildContext context,
    List<DematecUiMoreOptionsItem> items,
  ) => InputDecoration(
    contentPadding: EdgeInsets.only(top: 8),
    isDense: true,
    fillColor: isEnabled
        ? Colors.transparent
        : DematecUiColorsConstants.surface200,
    filled: true,
    prefixIcon: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: DematecUiMoreOptions(
        items: items,
        child: Icon(
          iconData,
          color: DematecUiColorsConstants.surface500,
          size: sizeIcon,
        ),
      ),
    ),
    suffixIcon: GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.close,
        color: DematecUiColorsConstants.surface500,
        size: sizeIcon,
      ),
    ),
    hintText: hint,
    hintStyle: TextStyle(
      color: DematecUiColorsConstants.surface500,
      fontSize: sizeField,
    ),
    border: _outlineInputBorder(1, DematecUiColorsConstants.surface200),
    enabledBorder: _outlineInputBorder(
      1.5,
      DematecUiColorsConstants.surface300,
    ),
    focusedBorder: _outlineInputBorder(1, DematecUiColorsConstants.surface500),
    disabledBorder: _outlineInputBorder(
      1.5,
      DematecUiColorsConstants.surface200,
    ),
  );
}

InputBorder _outlineInputBorder(double width, Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(width: width, color: color),
  );
}
