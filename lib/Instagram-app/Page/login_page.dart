import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                child: GestureDetector(
                  onTap: () {},
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
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 80),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey.withOpacity(0.4),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/Google.png',
                          width: 35,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text('Google')
                      ],
                    ),
                  ),
                )),
            const Text("Don't have an account?",
                style: TextStyle(fontSize: 16)),
            RichText(
                text: TextSpan(children: <TextSpan>[
              const TextSpan(
                  text: 'Sign up on ',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              TextSpan(
                  text: 'Facebook ',
                  style: const TextStyle(color: Colors.blue, fontSize: 16),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              const TextSpan(
                  text: 'or create an account on ',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              TextSpan(
                  text: 'Google',
                  style: const TextStyle(color: Colors.blue, fontSize: 16),
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ])),
          ],
        ),
      )),
    );
  }
}
