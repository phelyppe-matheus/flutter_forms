import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  static var routeName = '/filter';

  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> names = [
    'Laura',
    'Amanda',
    'João',
    'Vinícius',
    'Armando',
    'Julia',
    'José',
    'Maria Aparecida',
    'Aristótenes Silva',
    'Mario Quintana',
    'Andrade Júnior',
  ];

  List<String> _filteredList = [];

  bool _nomeComposto = false;
  bool _nomeSimples = false;

  @override
  Widget build(BuildContext context) {
    _filteredList = names.where(
      (element) {
        bool _isComposto = element.contains(' ');

        return (_isComposto && _nomeComposto) || (!_isComposto && _nomeSimples);
      },
    ).toList();
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Checkbox(
              onChanged: (value) => setState(() => _nomeComposto = value!),
              value: _nomeComposto,
            ),
            title: const Text("Nome Composto"),
          ),
          ListTile(
            leading: Checkbox(
              onChanged: (value) => setState(() => _nomeSimples = value!),
              value: _nomeSimples,
            ),
            title: const Text("Nome Simples"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: (context, index) {
                return Text(_filteredList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
