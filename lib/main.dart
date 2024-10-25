import 'package:flutter/material.dart';
import 'package:primeiro_app/presenter/first_page.dart';
import 'presenter/second_page.dart';
import 'presenter/third_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const FirstPage(),
        "/second": (context) => const SecondPage(),
        "/third": (context) => const ThirdPage(),
      },
    );
  }
}
