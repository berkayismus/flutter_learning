import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning/state_management/counter_notifier.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final counterNotifier = CounterNotifier();
  final valueNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
      ),
      body: _buildBody2(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        ListenableBuilder(
          listenable: counterNotifier,
          builder: (context, child) {
            return Text('counter: ${counterNotifier.count}');
          },
        ),
        TextButton(
          child: const Text('Increment'),
          onPressed: () {
            counterNotifier.increment();
          },
        ),
      ],
    );
  }

  Widget _buildBody2() {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return Text('counter: $value');
          },
        ),
        TextButton(
          child: const Text('Increment'),
          onPressed: () {
            valueNotifier.value++;
          },
        ),
      ],
    );
  }
}
