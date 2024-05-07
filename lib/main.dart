import 'package:bmi_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFe0ddaa),
        ),
        primaryColor: const Color(0xFF203239),
        scaffoldBackgroundColor: const Color(0xFF98A7A7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF203239),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xFFe0ddaa),
          ),
          titleTextStyle: TextStyle(
              color: Color(0xFFe0ddaa),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFe0ddaa),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Color(0xFFe0ddaa),
          ),
          bodyMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFFe0ddaa),
          ),
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFe0ddaa),
          ),
        ),
      ),
    );
  }
}
