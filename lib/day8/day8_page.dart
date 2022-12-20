import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/day8/planted_forest.dart';
import 'package:flutter/material.dart';


class Day8Page extends StatelessWidget {
  const Day8Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 8')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          var plantedForest = PlantedForest.fromInput(input);
          return plantedForest.countVisibleTrees().toString();
        },
        button1Label: 'Count Visible Trees',
        button2Calculation: (input) {
          var plantedForest = PlantedForest.fromInput(input);
          return plantedForest.findBestTreeHouse().toString();
        },
        button2Label: 'Get Best View',
      ),
    );
  }
}
