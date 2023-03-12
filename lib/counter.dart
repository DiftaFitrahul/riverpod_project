import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = StateProvider<int>(
      (ref) => 0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterPage'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) =>
                  Text(ref.watch(provider).toString()),
            ),
            SizedBox(
              height: 100,
            ),
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                  onPressed: () {
                    ref.read(provider.notifier).state++;
                  },
                  child: const Text('add')),
            )
          ],
        ),
      ),
    );
  }
}
