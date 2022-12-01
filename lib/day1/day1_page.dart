import 'package:adventofcode2022/utils/calorie_counter.dart';
import 'package:flutter/material.dart';

import '../utils/elf.dart';

class Day1Page extends StatefulWidget {
  const Day1Page({super.key});

  @override
  State<Day1Page> createState() => _Day1PageState();
}

class _Day1PageState extends State<Day1Page> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var maxCalories = '';
  var topThreeCalories = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 1'),),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Pleas enter some food';
                      }
                      return null;
                    },
                    controller: textController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      var elves = parseElves(textController.text);
                      setState(() {
                        maxCalories = CalorieCounter.findMaxCalories(elves).toString();
                      });
                    }
                  },
                  child: const Text('Get Max Calories') 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(maxCalories),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      var elves = parseElves(textController.text);
                      setState(() {
                        topThreeCalories = CalorieCounter.findMaxXCalories(elves, 3).toString();
                      });
                    }
                  },
                  child: const Text('Get Top Three Calories') 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(topThreeCalories),
              ),
            ]),
        ),
      )
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