import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class DematecUiBodyMedium extends StatelessWidget {
  const DematecUiBodyMedium({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: color ?? DematecUiColorsConstants.surface500,
        fontSize: 11,
      ),
    );
  }
}
