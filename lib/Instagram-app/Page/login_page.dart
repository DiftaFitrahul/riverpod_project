import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/auth/notifiers/auth_state_notifier.dart';
import 'package:riverpod_project/Instagram-app/views/components/loading/loading_screen.dart';
import 'package:riverpod_project/Instagram-app/views/login/login_viem_signup_link.dart';

import '../state/auth/providers/auth_state_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Instagram'),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Text('Welcome to Instagram',
                  softWrap: true,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  'Log into your account using one of the options below',
                  softWrap: true,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Consumer(
                  builder: (_, ref, __) => GestureDetector(
                    onTap: () {
                      ref
                          .read(authStateNotifierProvider.notifier)
                          .logInWithGoogle();
                      //LoadingScreen.instance().show(context: context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Google.png',
                            width: 31,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text('Google')
                        ],
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 80),
                child: Consumer(
                  builder: (_, ref, __) => GestureDetector(
                    onTap: () {
                      ref
                          .read(authStateNotifierProvider.notifier)
                          .loginWithFacebook();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.facebook,
                            size: 40,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text('Facebook')
                        ],
                      ),
                    ),
                  ),
                )),
            const LoginViewSignUpLink()
          ],
        ),
      )),
    );
  }
}
