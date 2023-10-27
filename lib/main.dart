import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experience/state_notifier_usage.dart';

void main() {
  runApp(
    const ProviderScope(
      child: StateNotifierUsage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const MyText(), MyCounterText(sayac: _counter)],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(
        onIncrement: () {
          _counter++;
          setState(() {});
        },
      ),
    );
  }
}

class MyCounterText extends StatelessWidget {
  final int sayac;
  const MyCounterText({
    Key? key,
    required this.sayac,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sayac.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback onIncrement;
  const MyFloatingActionButton({
    Key? key,
    required this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onIncrement();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
