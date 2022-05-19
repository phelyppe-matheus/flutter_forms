import 'package:flutter/material.dart';

class ImageScalerPage extends StatefulWidget {
  static var routeName = '/scale';

  const ImageScalerPage({Key? key}) : super(key: key);

  @override
  State<ImageScalerPage> createState() => _ImageScalerPageState();
}

class _ImageScalerPageState extends State<ImageScalerPage> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/on.png',
                height: 3 * _currentSliderValue,
              ),
            ),
          ),
          Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 10,
            onChanged: (double value) {
              setState(() => _currentSliderValue = value);
            },
          ),
        ],
      ),
    );
  }
}
