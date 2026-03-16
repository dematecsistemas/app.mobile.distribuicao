import 'package:flutter/material.dart';

class UiPaddings {
  static EdgeInsets get screen => const EdgeInsets.fromLTRB(16, 16, 16, 32);
  static EdgeInsets screenBottom(BuildContext context) => EdgeInsets.fromLTRB(
    16,
    16,
    16,
    MediaQuery.of(context).padding.bottom + 16,
  );
  static EdgeInsets get screenWithLegend =>
      const EdgeInsets.fromLTRB(16, 16, 16, 8);
}
