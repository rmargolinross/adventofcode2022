import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  const DayButton({super.key, required this.title, required this.path, this.enabled = false});

  final String title;
  final String path;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return (
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: enabled ? () => Navigator.pushNamed(context, path) : null,
          child: Text(title),
        ),
      )
    );
  }
}