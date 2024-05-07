import 'dart:math';

import '../result/result_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body Mass Index'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    gender(context, 'male'),
                    const SizedBox(width: 15),
                    gender(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 4),
                          Text('CM',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      Slider(
                        inactiveColor: const Color(0xFFe0ddaa),
                        activeColor: const Color(0xFF98A7A7),
                        min: 90,
                        max: 220,
                        value: heightVal,
                        onChanged: (newValue) =>
                            setState(() => heightVal = newValue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(width: 15),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(heightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                          result: result, isMale: isMale, age: age),
                    ),
                  );
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded gender(BuildContext context, String gender) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            isMale = (gender == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                (isMale && gender == 'male') || (!isMale && gender == 'female')
                    ? const Color(0xFF4a585b)
                    : Theme.of(context).primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(gender == 'male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(height: 15),
              Text(
                gender == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 6),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  mini: true,
                  child: const Icon(
                    Icons.remove,
                    color: Color(0xFF203239),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  mini: true,
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF203239),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
