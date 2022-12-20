import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/day1/calorie_counter.dart';
import 'package:flutter/material.dart';

import 'elf.dart';

class Day1Page extends StatelessWidget {
  const Day1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 1'),),
      body: PuzzleInputOutput(
        button1Label: 'Get Max Calories',
        button1Calculation: (input) {
          var elves = parseElves(input);
          return CalorieCounter.findMaxCalories(elves).toString();
        },
        button2Label: 'Get Top Three Calories',
        button2Calculation: (input) {
          var elves = parseElves(input);
          return  CalorieCounter.findMaxXCalories(elves, 3).toString();
        },
      ),
    );
  }
}

List<Elf> parseElves(String input) {
  List<Elf> elves = [];
  List<int> food = [];
  for(String line in input.split('\n')) {
    if (line.isEmpty) {
      elves.add(Elf(food));
      food = [];
    } else {
      food.add(int.parse(line));
    }
  }

  return elves;
}