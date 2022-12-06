import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/utils/elf_group.dart';
import 'package:adventofcode2022/utils/rucksack.dart';
import 'package:flutter/material.dart';

class Day3Page extends StatelessWidget {
  const Day3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 3')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          var total = 0;
          for(String rucksack in input.split('\n')) {
            var sack = Rucksack.fromFullRucksack(rucksack);
            total += sack.getMatchingValue();
          }
          return total.toString();
        },
        button1Label: 'Get Priorities',
        button2Calculation: (input) {
          var sacks = input.split('\n');
          print(sacks.length.toString());
          var total = 0;
          for(int i=0; i < sacks.length; i+= 3) {
            var group = ElfGroup(
              Rucksack.fromFullRucksack(sacks[i]),
              Rucksack.fromFullRucksack(sacks[i+1]),
              Rucksack.fromFullRucksack(sacks[i+2])
            );
            print(group.findSharedLetter());
            total += group.getBadgePriority();
          }

          return total.toString();
        },
        button2Label: 'Get Total Score Real',
      ),
    );
  }
}