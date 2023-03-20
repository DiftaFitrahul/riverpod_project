import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './home_page.dart';

import '../Page/login_page.dart';
import '../provider/auth_provider.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userState);
    return user.when(
        data: (user) {
          if (user != null) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
        error: (error, __) => const LoginPage(),
        loading: () => const CircularProgressIndicator());
  }
}
