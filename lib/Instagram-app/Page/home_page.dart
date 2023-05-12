import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/auth/providers/user_id_provider.dart';

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
                final idUser = ref.watch(userIdProvider);
                return Text('Your id : $idUser');
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer(
                builder: (context, ref, child) => ElevatedButton(
                    onPressed: () async {
                      await ref
                          .read(authStateNotifierProvider.notifier)
                          .logOut();
                    },
                    child: const Text('LogOut'))),
          ],
        ),
      ),
    );
  }
}
