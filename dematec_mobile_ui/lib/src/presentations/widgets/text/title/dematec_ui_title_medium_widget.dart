import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class DematecUiTitleMedium extends StatelessWidget {
  const DematecUiTitleMedium({super.key, required this.text, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: color ?? DematecUiColorsConstants.neutral800,
      ),
    );
  }
}
