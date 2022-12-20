import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import 'cleanup.dart';

class Day4Page extends StatelessWidget {
  const Day4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 4')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          return Cleanup.fromInput(input).countContainers().toString();
        },
        button1Label: 'Count Contained Sections',
        button2Calculation: (input) {
          return Cleanup.fromInput(input).countOverlaps().toString();
        },
        button2Label: 'Count Overlapping Sections',
      ),
    );
  }
}