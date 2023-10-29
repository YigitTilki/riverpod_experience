import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experience/todo_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RiverPodToDoApp(),
    ),
  );
}

class RiverPodToDoApp extends StatelessWidget {
  const RiverPodToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}
