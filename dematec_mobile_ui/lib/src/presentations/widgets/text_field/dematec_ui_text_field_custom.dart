import 'package:flutter/material.dart';
import '../../../../dematec_mobile_ui.dart';

class DematecUiTextFieldCustom extends StatefulWidget {
  const DematecUiTextFieldCustom({
    super.key,
    this.label,
    this.isObscure = false,
    this.styleField = DematecUiTextFieldStyleEnum.normal,
    required this.controller,
    this.colorBorder = Colors.transparent,
    this.textInputType = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.readOnly = false,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.prefixIcon,
    this.onTapPrefixIcon,
    this.onChanged,
    this.focusNode,
    this.onEditingCompleted,
    this.onTap,
    this.onlyBorderBottom = false,
    this.size = DematecUiTextFieldSizeEnum.normal,
  });

  final String? label;
  final bool isObscure;
  final TextEditingController controller;
  final Color colorBorder;
  final DematecUiTextFieldStyleEnum styleField;
  final TextInputType textInputType;
  final IconData? suffixIcon;
  final Function()? onTapSuffixIcon;
  final IconData? prefixIcon;
  final Function()? onTapPrefixIcon;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final Function()? onEditingCompleted;
  final bool onlyBorderBottom;
  final DematecUiTextFieldSizeEnum size;

  @override
  State<DematecUiTextFieldCustom> createState() =>
      _DematecUiTextFieldCustomState();
}

class _DematecUiTextFieldCustomState extends State<DematecUiTextFieldCustom> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorSuffixIcon = widget.onTapSuffixIcon == null
        ? DematecUiColorsConstants.neutral400
        : DematecUiColorsConstants.surface400;
    final colorPrefixIcon = widget.onTapPrefixIcon == null
        ? DematecUiColorsConstants.neutral400
        : DematecUiColorsConstants.surface400;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      height: widget.size == DematecUiTextFieldSizeEnum.normal ? 50 : 42,
      decoration: BoxDecoration(
        color: DematecUiColorsConstants.white,
        borderRadius: BorderRadius.circular(widget.onlyBorderBottom ? 0 : 8),
        border: widget.onlyBorderBottom
            ? Border(bottom: BorderSide(color: widget.colorBorder))
            : Border.all(color: widget.colorBorder),
        boxShadow: [
          if (!widget.onlyBorderBottom) ...[
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0, 1),
              color: Colors.black.withAlpha(20),
              spreadRadius: 0,
            ),
          ],
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.suffixIcon != null) ...[
            const SizedBox(width: 6),
            SizedBox(
              height: 28,
              width: 28,
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (widget.onTapSuffixIcon != null) {
                    widget.onTapSuffixIcon!();
                  }
                },
                icon: Icon(
                  widget.suffixIcon!,
                  size: 20,
                  color: colorSuffixIcon,
                ),
              ),
            ),
            const SizedBox(width: 6),
          ] else ...[
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: widget.label != null ? 12 : 0),
                  child: TextField(
                    focusNode: _focusNode,
                    textAlign: widget.textAlign,
                    readOnly: widget.readOnly,
                    onChanged: widget.onChanged,
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    obscureText: widget.isObscure,
                    onEditingComplete: widget.onEditingCompleted,
                    onTap: widget.onTap,
                    style: const TextStyle(
                      fontSize: 14,
                      color:
                          DematecUiColorsConstants.black, // Verifique esta cor
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: DematecUiTextFieldStyle.styleTextField(
                      context,
                      widget.styleField,
                    ),
                  ),
                ),
                if (widget.label != null) ...[
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 120),
                    top: (widget.controller.text.isEmpty && !isFocused) ? 7 : 1,
                    left: 0,
                    child: IgnorePointer(
                      child: Text(
                        widget.label!,
                        style: TextStyle(
                          fontSize:
                              (widget.controller.text.isEmpty && !isFocused)
                              ? 14
                              : 10,
                          color: (widget.controller.text.isEmpty && !isFocused)
                              ? DematecUiColorsConstants.neutral500
                              : DematecUiColorsConstants.neutral400,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.prefixIcon != null) ...[
            const SizedBox(width: 6),
            SizedBox(
              height: 28,
              width: 28,
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (widget.onTapPrefixIcon != null) {
                    widget.onTapPrefixIcon!();
                  }
                },
                icon: Icon(
                  widget.prefixIcon!,
                  size: 20,
                  color: colorPrefixIcon,
                ),
              ),
            ),
            const SizedBox(width: 6),
          ] else ...[
            const SizedBox(width: 12),
          ],
        ],
      ),
    );
  }
}
