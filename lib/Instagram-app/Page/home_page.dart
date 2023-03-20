import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/provider/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: Center(
        child: Column(
          children: [
            const Text('Hello Buddy'),
            const SizedBox(
              height: 50,
            ),
            Consumer(
                builder: (context, ref, child) => ElevatedButton(
                    onPressed: () {
                      ref.read(authProvider).signOutAccount();
                    },
                    child: const Text('LogOut')))
          ],
        ),
      ),
    );
  }
}
