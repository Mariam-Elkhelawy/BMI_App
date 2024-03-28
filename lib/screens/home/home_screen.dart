import 'dart:math';

import 'package:bmi_app/models/user_model.dart';
import 'package:bmi_app/screens/home/widgets/gender_widget.dart';

import '../result/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'ResultScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    GenderWidget( gender: 'male'),
                    const SizedBox(width: 15),
                    GenderWidget(gender: 'female'),
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
                    color: Colors.blueGrey,
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
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text('CM',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: heightVal,
                        onChanged: (newValue) => setState(() => heightVal = newValue),
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
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  double result = weight / pow(heightVal / 100, 2);
                  UserModel model =UserModel(gender: "female", age: age, result: result);
                  // Navigator.pushNamed(context, ResultScreen.routeName,arguments:model );

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

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 15),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
