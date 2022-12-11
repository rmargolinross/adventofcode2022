import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import '../utils/rope.dart';


class Day9Page extends StatelessWidget {
  const Day9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 9')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          var rope = Rope(2);
          rope.move(input);
          return rope.countVisitedPlaces().toString();
        },
        button1Label: 'Count Visited Rope Spots',
        button2Calculation: (input) {
          var rope = Rope(10);
          rope.move(input);
          return rope.countVisitedPlaces().toString();
        
        },
        button2Label: 'Count 10 Knot Rope',
      ),
    );
  }
}
