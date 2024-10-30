import 'package:flutter/material.dart';



class StepSeekBar extends StatefulWidget {
  @override
  _StepSeekBarState createState() => _StepSeekBarState();
}

class _StepSeekBarState extends State<StepSeekBar> {
  double _currentValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                  trackHeight: 2.0,
                  thumbColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayColor: Colors.black.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.black,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  value: _currentValue,
                  min: 0,
                  max: 4,
                  divisions: 4,
                  label: _labels[_currentValue.toInt()],
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_labels.length, (index) {
                  return _buildStepIndicator(index <= _currentValue, _labels[index]);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final List<String> _labels = ["0-1", "2-4", "5-6", "7-8", "9+"];

  Widget _buildStepIndicator(bool isFilled, String label) {
    return Column(
      children: [
        Container(
          width: 16,
          height: 30,
          decoration: BoxDecoration(
            color: isFilled ? Colors.white : Colors.black,
            border: Border.all(color: Colors.white),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}