import 'package:bmi_app/screens/home/home_screen.dart';
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
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'Overweight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }
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
        child: Column(
          children: [
            Image.asset('assets/images/result.png'),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF203239),
                    borderRadius: BorderRadius.circular(20),),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        result.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Your BMI Index',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFe0ddaa)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        resultPhrase,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      // const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ),
                  );
                },
                child: Text(
                  'Re-Calculate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
