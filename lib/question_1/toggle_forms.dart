import 'package:flutter/material.dart';

/// Implemente um app que faça uso do ToggleButtons que formate um texto
/// em itálico, negrito e sublinhado.
/// Mais de uma opção pode ser selecionada ao mesmo tempo.

class ToggleFormsArgs {
  final FocusNode focusNode;

  ToggleFormsArgs({required this.focusNode});
}

class ToggleForms extends StatefulWidget {
  final ToggleFormsArgs toggleFormsArgs;
  const ToggleForms({
    Key? key,
    required this.toggleFormsArgs,
  }) : super(key: key);

  @override
  State<ToggleForms> createState() => ToggleFormsState();
}

class ToggleFormsState extends State<ToggleForms> {
  bool _isItalic = false;
  bool _isBold = false;
  bool _isUnderline = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: widget.toggleFormsArgs.focusNode,
          style: TextStyle(
            fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
            fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
            decoration:
                _isUnderline ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
        _toggleButtons()
      ],
    );
  }

  Widget _toggleButtons() {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: TextButton(
              onPressed: () => setState(() => _isItalic = !_isItalic),
              child: Icon(
                _isItalic ? Icons.format_italic : Icons.format_italic_outlined,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: TextButton(
              onPressed: () => setState(() => _isBold = !_isBold),
              child: Icon(
                _isBold ? Icons.format_bold : Icons.format_bold_outlined,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: TextButton(
              onPressed: () => setState(() => _isUnderline = !_isUnderline),
              child: Icon(
                _isUnderline
                    ? Icons.format_underline
                    : Icons.format_underline_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
