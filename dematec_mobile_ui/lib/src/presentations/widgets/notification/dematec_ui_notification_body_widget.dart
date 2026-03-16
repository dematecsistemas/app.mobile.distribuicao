import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../dematec_mobile_ui.dart';

class DematecUiNotificationBodyWidget extends StatelessWidget {
  DematecUiNotificationBodyWidget({
    required this.text,
    required this.type,
    Key? key,
  }) : super(key: key);

  final String text;
  final DematecUiColorTypeWidget type;

  @override
  Widget build(BuildContext context) {
    final minHeight = math.min(50.0, MediaQuery.of(context).size.height);

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                spreadRadius: 12,
                blurRadius: 16,
              ),
            ],
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(color: type.color(context), width: 1.7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
