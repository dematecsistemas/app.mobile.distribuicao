import 'package:dematec_mobile_ui/src/presentations/widgets/more_options/dematec_ui_more_options_item.dart';
import 'package:flutter/material.dart';

class DematecUiMoreOptions extends StatefulWidget {
  DematecUiMoreOptions({
    super.key,
    required this.items,
    required this.child,
    this.offset,
    this.onLongPressed,
    this.openOnTap = false,
    this.blocked,
  });

  final List<DematecUiMoreOptionsItem> items;
  final Widget child;
  final Offset? offset;
  final Function(bool)? onLongPressed;
  final bool openOnTap;
  final bool? blocked;

  @override
  State<DematecUiMoreOptions> createState() => _DematecUiMoreOptionsState();
}

class _DematecUiMoreOptionsState extends State<DematecUiMoreOptions> {
  @override
  Widget build(BuildContext context) {
    MenuController menuController = MenuController();

    Offset offsetForUse = widget.offset ?? Offset(16, -16);

    return MenuAnchor(
      onOpen: () {
        if (widget.onLongPressed != null && widget.blocked != true) {
          widget.onLongPressed!(true);
        }
      },
      onClose: () {
        if (widget.onLongPressed != null && widget.blocked != true) {
          widget.onLongPressed!(false);
        }
      },
      controller: menuController,
      alignmentOffset: offsetForUse,
      style: const MenuStyle(
        visualDensity: VisualDensity.comfortable,
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        ),
      ),
      menuChildren: widget.items
          .map(
            (e) => Column(
              children: [
                if (e.dividerTop == true) ...[
                  const Divider(color: Colors.grey),
                ],
                e,
              ],
            ),
          )
          .toList(),
      builder: (_, __, ___) => GestureDetector(
        onTap: widget.openOnTap && widget.blocked != true
            ? () {
                menuController.open();
              }
            : null,
        onLongPress: () {
          if (!menuController.isOpen &&
              !widget.openOnTap &&
              widget.blocked != true) {
            menuController.open();
          }
        },
        child: Container(color: Colors.transparent, child: widget.child),
      ),
    );
  }
}
