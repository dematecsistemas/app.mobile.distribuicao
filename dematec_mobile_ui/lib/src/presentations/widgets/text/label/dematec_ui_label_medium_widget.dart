import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class DematecUiLabelMedium extends StatelessWidget {
  const DematecUiLabelMedium({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
    this.fontWeight,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.left,
      text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: color ?? DematecUiColorsConstants.neutral800,
        fontWeight: fontWeight,
      ),
    );
  }
}
