import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primeiro_app/domain/activity_usecase.dart';
import 'package:primeiro_app/presenter/bloc/to_do_bloc.dart';
import 'package:primeiro_app/presenter/to_do_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDOBloc(ActivityUseCase),
      child: MaterialApp(
        home: ToDoPage(),
      ),
    );
  }
}
