import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

class Day15Page extends StatelessWidget {
  const Day15Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 15')),
      body: PuzzleInputOutput(
        button1Label: 'Find Shortest Path',
        button1Calculation: (input) {
        },
        button2Label: 'Find Best Path',
        button2Calculation: (input) {
        },
      ),
    );
  }
}
