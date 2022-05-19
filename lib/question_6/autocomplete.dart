import 'package:flutter/material.dart';

class AutoCompletePage extends StatefulWidget {
  static var routeName = '/autocomplete';

  const AutoCompletePage({Key? key}) : super(key: key);

  @override
  State<AutoCompletePage> createState() => _AutoCompletePageState();
}

class _AutoCompletePageState extends State<AutoCompletePage> {
  List<String> names = [
    'Laura',
    'Amanda',
    'João',
    'Vinícius',
    'Armando',
    'Julia',
    'José',
    'Maria Aparecida',
  ];

  List<String> _autoCompleteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (str) {
              setState(
                () {
                  _autoCompleteList = str.isEmpty
                      ? []
                      : names
                          .where(
                            (element) => element
                                .toLowerCase()
                                .contains(str.toLowerCase()),
                          )
                          .toList();
                },
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _autoCompleteList.length,
              itemBuilder: (context, index) {
                return Text(_autoCompleteList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
