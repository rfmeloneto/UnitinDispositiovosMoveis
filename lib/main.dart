import 'package:flutter/material.dart';
import 'package:primeiro_app/exemplo_aspect_ratio.dart';
import 'package:primeiro_app/exemplo_expanded.dart';
import 'package:primeiro_app/exemplo_flexible.dart';
import 'package:primeiro_app/exemplo_single_child_scroll_view.dart';
import 'package:primeiro_app/exemplo_wrap.dart';
import 'package:primeiro_app/media_query_vs_layout_builder.dart';
import 'package:primeiro_app/page_with_media_query.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: ExemploSingleChildScrollView(),
      );
  }
  
}
