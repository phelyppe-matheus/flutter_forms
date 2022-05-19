import 'package:flutter/material.dart';
import 'package:flutter_forms/question_2/three_forms.dart';
import 'package:flutter_forms/question_3/checkboxes.dart';
import 'package:flutter_forms/question_4/luz_switch.dart';
import 'package:flutter_forms/question_5/image_scaler.dart';
import 'package:flutter_forms/question_6/autocomplete.dart';
import 'package:flutter_forms/question_7/filter.dart';

void main() => runApp(
      MaterialApp(
        home: const HomeApp(),
        routes: {
          ThreeForms.routeName: (context) => const ThreeForms(),
          CheckboxApp.routeName: (context) => const CheckboxApp(),
          LuzSwitch.routeName: (context) => const LuzSwitch(),
          ImageScalerPage.routeName: (context) => const ImageScalerPage(),
          AutoCompletePage.routeName: (context) => const AutoCompletePage(),
          FilterPage.routeName: (context) => const FilterPage(),
        },
      ),
    );

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _questionBuild(ThreeForms.routeName, CheckboxApp.routeName, context),
        _questionBuild(LuzSwitch.routeName, ImageScalerPage.routeName, context),
        _questionBuild(
            AutoCompletePage.routeName, FilterPage.routeName, context),
      ]),
    );
  }

  _questionBuild(String routeName, String routeName2, BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, routeName);
              },
              child: Text(routeName),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, routeName2);
              },
              child: Text(routeName2),
            ),
          ),
        ],
      ),
    );
  }
}
