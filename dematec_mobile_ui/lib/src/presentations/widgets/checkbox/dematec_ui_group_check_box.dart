import 'package:flutter/material.dart';
import 'dematec_ui_checkbox_custom.dart';

class DematecUiGroupCheckBox extends StatelessWidget {
  const DematecUiGroupCheckBox({
    Key? key,
    required this.items,
    this.isVertical = false,
    this.checkboxMaster,
  }) : super(key: key);

  final DematecUiCheckboxCustom? checkboxMaster;
  final List<DematecUiCheckboxCustom> items;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              checkboxMaster ?? Container(),
              Padding(
                padding: EdgeInsets.only(left: checkboxMaster == null ? 0 : 16),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: items,
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              checkboxMaster ?? Container(),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: checkboxMaster == null ? 0 : 16,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: items,
                  ),
                ),
              ),
            ],
          );
  }
}
