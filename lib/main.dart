import 'package:flutter/material.dart';

import 'day1/day1_page.dart';
import 'day2/day2_page.dart';
import 'day3/day3_page.dart';
import 'day4/day4_page.dart';
import 'day5/day5_page.dart';
import 'day6/day6_page.dart';
import 'day7/day7_page.dart';
import 'day8/day8_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.green,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}

Map<String, Widget Function(dynamic context)> routes = {
  '/': (context) => const HomePage(title: 'Advent of Code 2022'),
  '/day1': (context) => const Day1Page(),
  '/day2': (context) => const Day2Page(),
  '/day3': (context) => const Day3Page(),
  '/day4': (context) => const Day4Page(),
  '/day5': (context) => const Day5Page(),
  '/day6': (context) => const Day6Page(),
  '/day7': (context) => const Day7Page(),
  '/day8': (context) => const Day8Page(),
};