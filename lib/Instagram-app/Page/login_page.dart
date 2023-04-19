import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/views/constants/app_color.dart';
import 'package:riverpod_project/Instagram-app/views/login/divider_with_margin.dart';
import 'package:riverpod_project/Instagram-app/views/login/facebook_button.dart';
import 'package:riverpod_project/Instagram-app/views/login/google_button.dart';
import 'package:riverpod_project/Instagram-app/views/login/login_viem_signup_link.dart';

import '../state/auth/providers/auth_state_provider.dart';
import '../views/constants/Strings.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(Strings.appName),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                Strings.welcomeToAppName,
                style: TextStyle(fontSize: 40),
              ),
              const DividerWithMargin(),
              const Text(Strings.logIntoYourAccount),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor),
                onPressed: ref
                    .watch(authStateNotifierProvider.notifier)
                    .loginWithFacebook,
                child: const FacebookButton(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor),
                onPressed: ref
                    .watch(authStateNotifierProvider.notifier)
                    .logInWithGoogle,
                child: const GoogleButton(),
              ),
              const DividerWithMargin(),
              const LoginViewSignUpLink()
            ],
          ),
        ),
      )),
    );
  }
}
