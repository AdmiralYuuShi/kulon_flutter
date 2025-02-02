import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:kulon/src/core/core.dart';

class AnalogClockWidget extends StatelessWidget {
  const AnalogClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnalogClock(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Badge(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                backgroundColor: Colors.blue,
                label: Text('Asia/Jakarta'),
              ),
              SizedBox(height: 4),
              Badge(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                label: Text('PM'),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
        SizedBox(height: 16),
        Badge(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          label: Text(DateTime.now().bestDateFormat),
        ),
      ],
    );
  }
}
