import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});
  @override
  State<StatefulWidget> createState() {
    return _BmiCalculatorState();
  }
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  void _showBMI() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);
    final invalidHeight = height == null || height <= 0;
    final inValidWeight = weight == null || weight <= 0;

    @override
    void dispose() {
      _heightController.dispose();
      _weightController.dispose();
      super.dispose();
    }

    if (inValidWeight || invalidHeight) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Inavlid inputs.'),
              content: const Text(
                  'Please ensure that you have entered a valid weight and height'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Okay'),
                )
              ],
            );
          });
      return;
    }

    final bmi = (weight / (height * height)).toStringAsFixed(2);

    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Your BMI'),
            content: Text(
              'Your BMI is $bmi',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "BMI (Body Mass Index) is a measure used to assess body fat based on weight and height. It provides an indication of whether a person's weight is within a healthy range.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text("Enter your Weight (Kg)")),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text("Enter your Height (meter)")),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _showBMI, child: const Text('Calculate BMI'))
        ]),
      ),
    );
  }
}
