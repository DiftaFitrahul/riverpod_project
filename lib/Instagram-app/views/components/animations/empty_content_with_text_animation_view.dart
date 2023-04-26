import 'package:flutter/material.dart';
import 'package:riverpod_project/Instagram-app/views/components/animations/empty_content_animation_view.dart';

class EmptyContentWithTextAnimationView extends StatelessWidget {
  final String text;
  const EmptyContentWithTextAnimationView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              text,
            ),
          ),
          const EmptyContentAnimationView()
        ],
      ),
    );
  }
}
