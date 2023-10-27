import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experience/all_providers.dart';

class RiverpodBasics extends StatelessWidget {
  const RiverpodBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Consumer(builder: (context, ref, child) {
          var title = ref.watch(titleProvider);
          return Text(title);
        }),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[MyText(), MyCounterText()],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterStateProvider);
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var text = ref.watch(textProvider);
    return Text(
      text,
    );
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(counterStateProvider.notifier).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
