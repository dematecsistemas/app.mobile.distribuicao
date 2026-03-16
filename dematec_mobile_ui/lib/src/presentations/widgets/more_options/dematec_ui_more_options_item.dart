import 'package:flutter/material.dart';

class DematecUiMoreOptionsItem extends StatelessWidget {
  const DematecUiMoreOptionsItem({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
    this.description,
    this.dividerTop,
    this.color,
    this.iconColor,
    this.backgroundColor,
    this.children,
  });

  final IconData? icon;
  final String title;
  final String? description;
  final void Function() onTap;
  final bool? dividerTop;
  final Color? color;
  final Color? iconColor;
  final Color? backgroundColor;
  final Widget? children;

  @override
  Widget build(BuildContext context) {
    final textColor =
        color ??
        (Theme.of(context).colorScheme.tertiary as MaterialColor)[800] ??
        Colors.black87;
    final iconColorDefault =
        iconColor ??
        (Theme.of(context).colorScheme.tertiary as MaterialColor)[400] ??
        Colors.black45;
    final backgroundColorForUse = backgroundColor ?? Colors.transparent;

    return MenuItemButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(backgroundColorForUse),
      ),
      onPressed: onTap,
      child:
          children ??
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColorDefault, size: 28),
              ],
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: textColor, fontSize: 16)),
                  if (description != null) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        description!,
                        style: TextStyle(fontSize: 12, color: textColor),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
    );
  }
}
