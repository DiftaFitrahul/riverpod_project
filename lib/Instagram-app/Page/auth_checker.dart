import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/Page/main_view.dart';
import 'package:riverpod_project/Instagram-app/state/providers/is_loading_provider.dart';
import '../state/auth/providers/is_logged_in_provider.dart';
import '../views/components/loading/loading_screen.dart';

import '../Page/login_page.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    ref.listen<bool>(isLoadingProvider, (_, next) {
      if (next) {
        LoadingScreen.instance().show(context: context);
      } else {
        LoadingScreen.instance().hide();
      }
    });
    if (isLoggedIn) {
      return const MainView();
    } else {
      return const LoginPage();
    }
  }
}
