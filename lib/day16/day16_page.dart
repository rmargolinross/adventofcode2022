import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

class Day16Page extends StatelessWidget {
  const Day16Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 16')),
      body: PuzzleInputOutput(
        button1Label: 'Find Empty Positions',
        button1Calculation: (input) {
        },
        button2Label: 'Find Tuning Frequency',
        button2Calculation: (input) {
        },
      ),
    );
  }
}
