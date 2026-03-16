import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';
import 'dematec_ui_style_check_box.dart';

class DematecUiCheckboxCustom extends StatelessWidget {
  const DematecUiCheckboxCustom({
    Key? key,
    this.title = "",
    required this.onPressed,
    required this.isCheck,
    this.disabled = false,
    this.isIndeterminate = false,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final bool disabled;
  final bool isCheck;
  final bool isIndeterminate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          style: DematecUiStyleCheckBox.styleCheckbox(context),
          onPressed: disabled ? null : onPressed,
          icon: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: getColorBackground(context),
              border: Border.all(color: getColorBorder(context), width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Icon(
                getIconByType(),
                size: 14,
                color: DematecUiColorsConstants.surface200,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: getColorText(context),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  IconData? getIconByType() {
    if (isCheck) {
      return Icons.check;
    } else if (isIndeterminate) {
      return Icons.remove;
    } else {
      return null;
    }
  }

  Color getColorBackground(BuildContext context) {
    if (disabled) {
      return DematecUiColorsConstants.surface300;
    } else if (isIndeterminate || isCheck) {
      return Theme.of(context).colorScheme.surface;
    } else {
      return Colors.white;
    }
  }

  Color getColorText(BuildContext context) {
    if (disabled) {
      return DematecUiColorsConstants.surface700;
    } else {
      return DematecUiColorsConstants.tertiary800;
    }
  }

  Color getColorBorder(BuildContext context) {
    if (disabled) {
      return DematecUiColorsConstants.surface300;
    } else {
      return DematecUiColorsConstants.tertiary600;
    }
  }
}
