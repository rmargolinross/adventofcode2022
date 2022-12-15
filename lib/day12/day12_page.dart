import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import '../utils/height_map.dart';

class Day12Page extends StatelessWidget {
  const Day12Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 12')),
      body: PuzzleInputOutput(
        button1Label: 'Find Shortest Path',
        button1Calculation: (input) {
          var map = HeightMap(input);
          return map.findShortestPathS().toString();
        },
        button2Label: 'Find Best Path',
        button2Calculation: (input) {
          var map = HeightMap(input);
          return map.findShortestPathAll().toString();
        },
      ),
    );
  }
}
