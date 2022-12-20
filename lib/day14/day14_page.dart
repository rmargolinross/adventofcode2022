import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import '../utils/sand.dart';

class Day14Page extends StatelessWidget {
  const Day14Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 14')),
      body: PuzzleInputOutput(
        button1Label: 'Count Sand',
        button1Calculation: (input) {
          var cave = Sand(input);
          cave.dropSand();
          return cave.countSand().toString();
        },
        button2Label: 'Count Sand With Floor',
        button2Calculation: (input) {
          var cave = Sand(input, hasFloor: true);
          cave.dropSand();
          return cave.countSand().toString();
        },
      ),
    );
  }
}
