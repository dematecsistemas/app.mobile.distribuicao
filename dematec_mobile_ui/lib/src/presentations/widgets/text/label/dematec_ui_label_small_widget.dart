import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class DematecUiLabelSmall extends StatelessWidget {
  const DematecUiLabelSmall({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.overflow,
  });

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
        color: color ?? DematecUiColorsConstants.neutral800,
        fontWeight: fontWeight,
      ),
    );
  }
}
