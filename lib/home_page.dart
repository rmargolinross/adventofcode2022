import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/day1'),
                child: const Text('Day 1')
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: null, 
                child: Text('Day 2'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
