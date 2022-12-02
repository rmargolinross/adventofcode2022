import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/utils/rockpaperscissors.dart';
import 'package:flutter/material.dart';

class Day2Page extends StatelessWidget {
  const Day2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 2')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          return RockPaperScissors.fromInput(input).getTotalScore().toString();
        },
        button1Label: 'Get Total Score',
        button2Calculation: (input) {
          return RockPaperScissors.fromInputMode2(input).getTotalScore().toString();
        },
        button2Label: 'Get Total Score Real',
      ),
    );
  }
}