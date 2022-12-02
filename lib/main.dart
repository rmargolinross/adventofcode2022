import 'package:flutter/material.dart';

import 'day1/day1_page.dart';
import 'day2/day2_page.dart';
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
};