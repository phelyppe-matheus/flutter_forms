import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_forms/question_1/toggle_forms.dart';

/// Crie um app com 3 caixas de texto
/// que mude o foco ao pressionar
/// o enter do teclado.

class ThreeForms extends StatefulWidget {
  static final routeName = '/threeforms';

  const ThreeForms({Key? key}) : super(key: key);

  @override
  State<ThreeForms> createState() => _ThreeFormsState();
}

class _ThreeFormsState extends State<ThreeForms> {
  late List<FocusNode> _focusList;
  int focusedItem = 0;

  @override
  void initState() {
    super.initState();

    _focusList = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusList[0]);
    });
    for (var i = 0; i < _focusList.length; i++) {
      _focusList[i].addListener(() {
        focusedItem = i;
      });
    }
  }

  @override
  void dispose() {
    for (var element in _focusList) {
      element.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    focusedItem %= _focusList.length;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusList[focusedItem]);
    });

    return RawKeyboardListener(
      onKey: (event) {
        if (event.logicalKey == LogicalKeyboardKey.enter &&
            event is RawKeyUpEvent) {
          setState(() => ++focusedItem);
        }
      },
      focusNode: FocusNode(),
      child: Scaffold(
        body: Column(
          children: [
            _buildToggleForm("form1", _focusList[0]),
            _buildToggleForm("form2", _focusList[1]),
            _buildToggleForm("form3", _focusList[2]),
          ],
        ),
      ),
    );
  }

  Expanded _buildToggleForm(String value, FocusNode focus1) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 30,
        child: ToggleForms(
          key: Key(value),
          toggleFormsArgs: ToggleFormsArgs(
            focusNode: focus1,
          ),
        ),
      ),
    );
  }
}
