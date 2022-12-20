import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/day13/distress_signal.dart';
import 'package:flutter/material.dart';

class Day13Page extends StatelessWidget {
  const Day13Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 13')),
      body: PuzzleInputOutput(
        button1Label: 'Find Correct Packets',
        button1Calculation: (input) {
          var distress = DistressSignal(input);
          return distress.correctPackets().toString();
        },
        button2Label: 'Sort Packets',
        button2Calculation: (input) {
          var distress = DistressSignal(input);
          return distress.sortPackets().toString();
        },
      ),
    );
  }
}
