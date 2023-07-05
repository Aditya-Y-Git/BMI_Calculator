import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const BmiCalculator(),
    ),
  );
}
