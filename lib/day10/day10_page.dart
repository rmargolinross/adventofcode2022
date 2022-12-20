import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/day10/clock_circuit.dart';
import 'package:flutter/material.dart';


class Day10Page extends StatelessWidget {
  const Day10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 10')),
      body: PuzzleInputOutput(
        button1Label: 'Calculate Signal Strength',
        button1Calculation: (input) {
          var cpu = ClockCircuit();
          return cpu.getSignalStrengths(input, [20, 60, 100, 140, 180, 220]).toString();
        },
        button2Label: 'Get CRT',
        button2Calculation: (input) {
          var cpu = ClockCircuit();
          return cpu.drawCRT(input);
        },
      ),
    );
  }
}
