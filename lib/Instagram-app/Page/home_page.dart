import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/auth/notifiers/auth_state_notifier.dart';
import '../state/auth/providers/auth_state_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Hello Buddy'),
            Consumer(
              builder: (context, ref, child) {
                final idUser = ref.watch(authStateNotifierProvider).userId;
                return Text('Your id : $idUser');
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer(
                builder: (context, ref, child) => ElevatedButton(
                    onPressed: () {
                      ref.read(authStateNotifierProvider.notifier).logOut();
                    },
                    child: const Text('LogOut')))
          ],
        ),
      ),
    );
  }
}
