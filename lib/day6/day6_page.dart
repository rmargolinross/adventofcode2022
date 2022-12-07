import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

import '../utils/device.dart';

class Day6Page extends StatelessWidget {
  const Day6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 6')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          return Device.findStartOfPacketPosition(input).toString();
        },
        button1Label: 'Find start-of-packet',
        button2Calculation: (input) {
          return Device.findStartOfMessagePosition(input).toString();
        },
        button2Label: 'Find start-of-message',
      ),
    );
  }
}