import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LuzSwitch extends StatefulWidget {
  static var routeName = '/luz';

  const LuzSwitch({Key? key}) : super(key: key);

  @override
  _LuzSwitchState createState() => _LuzSwitchState();
}

class _LuzSwitchState extends State<LuzSwitch> {
  bool value = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(value ? 'Luz' : 'Escuro'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  value ? 'assets/on.png' : 'assets/off.png',
                  height: 300,
                ),
              ),
              Expanded(
                child: buildPlatforms(),
              ),
              Expanded(
                child: buildHeader(
                  text: 'Adaptive',
                  child: buildSwitch(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildPlatforms() => Row(
        children: [
          Expanded(
            child: buildHeader(text: 'Android', child: buildAndroidSwitch()),
          ),
          Expanded(
            child: buildHeader(text: 'iOS', child: buildIOSSwitch()),
          ),
        ],
      );

  Widget buildHeader({
    required Widget child,
    required String text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );

  Widget buildSwitch() => Transform.scale(
        scale: 2,
        child: Switch.adaptive(
          thumbColor: MaterialStateProperty.all(Colors.red),
          trackColor: MaterialStateProperty.all(Colors.orange),

          // activeColor: Colors.blueAccent,
          // activeTrackColor: Colors.blue.withOpacity(0.4),
          // inactiveThumbColor: Colors.orange,
          // inactiveTrackColor: Colors.black87,
          splashRadius: 50,
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

  Widget buildIOSSwitch() => Transform.scale(
        scale: 1.1,
        child: CupertinoSwitch(
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

  Widget buildAndroidSwitch() => Transform.scale(
        scale: 2,
        child: Switch(
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );
}
