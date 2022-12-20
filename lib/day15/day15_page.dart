import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import '../utils/sensors.dart';

class Day15Page extends StatelessWidget {
  const Day15Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 15')),
      body: PuzzleInputOutput(
        button1Label: 'Find Empty Positions',
        button1Calculation: (input) {
          var sensors = Sensors(input);
          return sensors.countCannotContain(2000000).toString();
        },
        button2Label: 'Find Tuning Frequency',
        button2Calculation: (input) {
          var sensors = Sensors(input);
          return sensors.tuningFrequency().toString();
        },
      ),
    );
  }
}
