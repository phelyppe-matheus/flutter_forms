import 'package:flutter/material.dart';

class CheckboxApp extends StatefulWidget {
  static const routeName = "/checkboxes";
  const CheckboxApp({Key? key}) : super(key: key);

  @override
  State<CheckboxApp> createState() => _CheckboxAppState();
}

class _CheckboxAppState extends State<CheckboxApp> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildOption(
            text: "I've read the privacity policy.",
            onChanged: (value) => setState(() => _value1 = value ?? false),
            value: _value1,
          ),
          _buildOption(
            text: "I allow the necessary subsequent downloads mentioned.",
            onChanged: (value) => setState(() => _value2 = value ?? false),
            value: _value2,
          ),
          _buildOption(
            text: "I allow the sharing of info for better perform.",
            onChanged: (value) => setState(() => _value3 = value ?? false),
            value: _value3,
          ),
          Divider(),
          _buildOption(
            text: "Allow all",
            onChanged: (value) {
              setState(() {
                _value1 = value ?? false;
                _value2 = value ?? false;
                _value3 = value ?? false;
              });
            },
            value: _checkAllValue,
            tristate: true,
          ),
        ],
      ),
    );
  }

  get _checkAllValue => _value1 && _value2 && _value3
      ? true
      : _value1 || _value2 || _value3
          ? null
          : false;

  _buildOption({
    required String text,
    required void Function(bool? value) onChanged,
    required bool? value,
    bool tristate = false,
  }) {
    return ListTile(
      leading: Checkbox(
        onChanged: onChanged,
        value: value,
        tristate: tristate,
      ),
      title: Text(text),
    );
  }
}
