import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class DematecUiSubTitleSmall extends StatelessWidget {
  const DematecUiSubTitleSmall({super.key, required this.text, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: color ?? DematecUiColorsConstants.neutral800,
      ),
    );
  }
}
