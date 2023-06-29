import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/post/provider/user_post_provider.dart';
import 'package:riverpod_project/Instagram-app/views/components/animations/empty_content_with_text_animation_view.dart';
import 'package:riverpod_project/Instagram-app/views/components/animations/error_animation_view.dart';
import 'package:riverpod_project/Instagram-app/views/components/post/post_grid_view.dart';
import 'package:riverpod_project/Instagram-app/views/constants/strings.dart';

import '../../components/animations/loading_animation_view.dart';

class UserPostView extends ConsumerWidget {
  const UserPostView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(userPostProvider);
        ref.read(userPostProvider);
        return await Future.delayed(const Duration(seconds: 1));
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentWithTextAnimationView(
                text: Strings.youHaveNoPosts);
          } else {
            return PostGridView(posts: posts);
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        }
      ),
    );
  }
}
