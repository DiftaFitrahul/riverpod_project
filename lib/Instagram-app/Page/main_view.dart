import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/auth/providers/auth_state_provider.dart';
import 'package:riverpod_project/Instagram-app/views/components/dialogs/alert_dialog_model.dart';
import 'package:riverpod_project/Instagram-app/views/components/dialogs/logout_dialog.dart';
import 'package:riverpod_project/Instagram-app/views/tabs/user_post/user_post_view.dart';

import '../views/constants/strings.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: () async {},
              icon: const FaIcon(FontAwesomeIcons.film),
            ),
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.add_a_photo_outlined),
            ),
            IconButton(
              onPressed: () async {
                final logoutValue = await const LogoutDialog()
                    .present(context)
                    .then((value) => value ?? false);
                if (logoutValue) {
                  await ref.read(authStateNotifierProvider.notifier).logOut();
                }
              },
              icon: const Icon(Icons.logout),
            )
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.home),
            )
          ]),
        ),
        body: const TabBarView(children: [
          UserPostView(),
          UserPostView(),
          UserPostView(),
        ]),
      ),
    );
  }
}
