import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30)
      resultText = 'Obese';
    else if (result > 25 && result < 30)
      resultText = 'Overweight';
    else if (result >= 18.5 && result <= 24.9)
      resultText = 'Normal';
    else
      resultText = 'Thin';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Result :',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.blueGrey,
                    ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.3),
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Result: ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Healthiness: $resultPhrase',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Age: $age',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey,
                    ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
