import 'package:flutter/material.dart';
import 'package:self_codinome/widgets/self_evaluation_screen.dart';

void main() => runApp(new SelfApp());

class SelfApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self',
      home: SelfEvaluationScreen(),
    );
  }
}