import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class GlorySoftUiBodyLarge extends StatelessWidget {
  const GlorySoftUiBodyLarge({super.key, required this.text, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: DematecUiColorsConstants.surface500,
      ),
    );
  }
}
