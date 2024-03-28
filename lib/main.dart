import 'package:bmi_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),

      // initialRoute: MyHomePage.routeName,
      // routes: {
      //   MyHomePage.routeName: (context) => MyHomePage(),
      //   ResultScreen.routeName: (context) => ResultScreen()
      // },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
