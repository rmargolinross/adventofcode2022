import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import '../utils/monkey_business.dart';


class Day11Page extends StatelessWidget {
  const Day11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 11')),
      body: PuzzleInputOutput(
        button1Label: 'Calculate Monkey Business',
        button1Calculation: (input) {
          var monkeys = MonkeyBusiness(input);
          for (int i = 0; i < 20; i++) {
            monkeys.makeRound(true);
          }

          return monkeys.getMonkeyBusiness().toString();
        },
        button2Label: 'Calculate Monkey Business Worry',
        button2Calculation: (input) {
          var monkeys = MonkeyBusiness(input);
          for (int i = 0; i < 10000; i++) {
            monkeys.makeRound(false);
          }
          
          return monkeys.getMonkeyBusiness().toString();
        },
      ),
    );
  }
}
