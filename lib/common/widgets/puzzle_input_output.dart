import 'dart:ui';

import 'package:flutter/material.dart';

class PuzzleInputOutput extends StatefulWidget {
  const PuzzleInputOutput({
    super.key,
    required this.button1Label,
    required this.button1Calculation,
    required this.button2Label,
    required this.button2Calculation,
  });

  final String button1Label;
  final String button2Label;
  final Function button1Calculation;
  final Function button2Calculation;

  @override
  State<PuzzleInputOutput> createState() => _PuzzleInputOutputState();
}

class _PuzzleInputOutputState extends State<PuzzleInputOutput> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var calculation1Result = '';
  var calculation2Result = '';

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
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
                        return 'Please enter the input';
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
                      setState(() {
                        calculation1Result = widget.button1Calculation(textController.text);
                      });
                    }
                  },
                  child: Text(widget.button1Label) 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(calculation1Result, maxLines: 100),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        calculation2Result = widget.button2Calculation(textController.text);
                      });
                    }
                  },
                  child: Text(widget.button2Label) 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  calculation2Result,
                  maxLines: 10,
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    fontFeatures: [
                      FontFeature.tabularFigures()
                    ]
                  ),
                ),
              ),
            ]),
        ),
      )
    );
  }
}