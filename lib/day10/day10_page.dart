import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';


class Day10Page extends StatelessWidget {
  const Day10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 10')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
        },
        button1Label: 'Count Visited Rope Spots',
        button2Calculation: (input) {
        },
        button2Label: 'Get Best View',
      ),
    );
  }
}
