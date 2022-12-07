import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:adventofcode2022/utils/file_system.dart';
import 'package:flutter/material.dart';


class Day7Page extends StatelessWidget {
  const Day7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 7')),
      body: PuzzleInputOutput(
        button1Calculation: (input) {
          var fileSystem = FileSystem(input);
          return fileSystem.getSumOfFolders(100000).toString();
        },
        button1Label: 'Find Sum Of Folders',
        button2Calculation: (input) {
          var fileSystem = FileSystem(input);
          return fileSystem.smallestFolderOfSize(
            30000000 - (70000000 - fileSystem.topFolder.getSize())
          ).toString();
        },
        button2Label: 'Find Smallest To Delete',
      ),
    );
  }
}
