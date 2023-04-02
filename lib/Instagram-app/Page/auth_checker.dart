import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/auth/notifiers/auth_state_notifier.dart';
import '../state/auth/models/auth_result.dart';
import '../state/auth/providers/auth_state_provider.dart';
import './home_page.dart';

import '../Page/login_page.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateNotifierProvider);
    if(user.result == AuthResult.success && user.userId != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
