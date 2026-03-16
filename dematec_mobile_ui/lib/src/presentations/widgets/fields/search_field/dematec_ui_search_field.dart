import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:dematec_mobile_ui/src/presentations/widgets/fields/search_field/dematec_ui_style_text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DematecUiSearchField extends StatefulWidget {
  const DematecUiSearchField({
    Key? key,
    this.title,
    this.controller,
    this.onEditingComplete,
    this.onChange,
    this.type,
    this.icon = PhosphorIconsRegular.magnifyingGlass,
    required this.hint,
    required this.isEnabled,
    required this.size,
    required this.isOpen,
    this.items,
    this.onTapScanner,
  }) : super(key: key);

  final String? title;
  final String hint;
  final bool isEnabled;
  final DematecUiSizeWidget size;
  final TextEditingController? controller;
  final bool isOpen;
  final IconData icon;
  final void Function(String s)? onChange;
  final void Function()? onEditingComplete;
  final TextInputType? type;
  final List<DematecUiMoreOptionsItem>? items;
  final VoidCallback? onTapScanner;

  @override
  State<DematecUiSearchField> createState() => _DematecUiSearchFieldState();
}

class _DematecUiSearchFieldState extends State<DematecUiSearchField> {
  late TextEditingController controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();

    _hasText = controller.text.isNotEmpty;

    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    // Só atualiza a tela (setState) se o estado de vazio/preenchido mudar,
    // isso economiza muita memória e processamento!
    final hasTextNow = controller.text.isNotEmpty;
    if (_hasText != hasTextNow) {
      setState(() {
        _hasText = hasTextNow;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onTextChanged);
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title?.isNotEmpty ?? false,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              widget.title ?? '',
              style: TextStyle(
                fontSize: getSizeTitle(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          height: getHeigthField(),
          child: TextField(
            keyboardType: widget.type,
            enabled: widget.isEnabled,
            controller: controller,
            onChanged: (s) => widget.onChange?.call(s),
            onEditingComplete: () {
              widget.onEditingComplete?.call();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: getSizeFont(),
            ),
            decoration:
                DematecUiStyleTextFieldSearch.styleTextFieldSearch(
                  widget.hint,
                  getSizeFont(),
                  getSizeIcon(),
                  widget.isEnabled,
                  widget.isOpen,
                  () {
                    controller.clear();
                    widget.onEditingComplete?.call();
                  },
                  widget.icon,
                  context,
                  widget.items ?? [],
                ).copyWith(
                  suffixIcon: _hasText
                      ? IconButton(
                          icon: Icon(
                            PhosphorIconsRegular.x,
                            size: getSizeIcon(),
                            color: DematecUiColorsConstants.primary500,
                          ),
                          onPressed: () {
                            controller.clear();
                            widget.onChange?.call('');
                            widget.onEditingComplete?.call();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            PhosphorIconsRegular.qrCode,
                            size: getSizeIcon(),
                            color: DematecUiColorsConstants.primary500,
                          ),
                          onPressed: widget.onTapScanner,
                        ),
                ),
          ),
        ),
      ],
    );
  }

  double getSizeTitle() {
    switch (widget.size) {
      case DematecUiSizeWidget.small:
        return 12;
      case DematecUiSizeWidget.medium:
        return 14;
      case DematecUiSizeWidget.large:
        return 16;
      default:
        return 12;
    }
  }

  double getSizeFont() {
    switch (widget.size) {
      case DematecUiSizeWidget.small:
        return 12;
      case DematecUiSizeWidget.medium:
        return 14;
      case DematecUiSizeWidget.large:
        return 16;
      default:
        return 12;
    }
  }

  double getHeigthField() {
    switch (widget.size) {
      case DematecUiSizeWidget.small:
        return 36;
      case DematecUiSizeWidget.medium:
        return 40;
      case DematecUiSizeWidget.large:
        return 44;
      default:
        return 36;
    }
  }

  double getSizeIcon() {
    switch (widget.size) {
      case DematecUiSizeWidget.small:
        return 16;
      case DematecUiSizeWidget.medium:
        return 20;
      case DematecUiSizeWidget.large:
        return 24;
      default:
        return 16;
    }
  }
}
