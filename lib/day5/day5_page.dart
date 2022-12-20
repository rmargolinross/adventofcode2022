import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import 'crane.dart';

class Day5Page extends StatelessWidget {
  const Day5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 5')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          var crane = Crane.fromInput(input);
          crane.moveCrates();
          return crane.getTopCrates();
        },
        button1Label: 'Get Top Crates',
        button2Calculation: (input) {
           var crane = Crane.fromInput(input);
          crane.moveCrates9001();
          return crane.getTopCrates();
        },
        button2Label: 'Get Top Crates 9001',
      ),
    );
  }
}