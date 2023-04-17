import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_project/Instagram-app/views/components/rich_text/base_text.dart';
import 'package:riverpod_project/Instagram-app/views/components/rich_text/link_text.dart';

class RichTextWidget extends StatelessWidget {
  final Iterable<BaseText> texts;
  final TextStyle? styleForAll;

  const RichTextWidget({
    super.key,
    required this.texts,
    this.styleForAll,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: texts.map((baseText) {
      if (baseText is LinkText) {
        return TextSpan(
            text: baseText.text,
            style: baseText.style?.merge(styleForAll),
            recognizer: TapGestureRecognizer()..onTap = baseText.callback);
      } else {
        return TextSpan(
          text: baseText.text,
          style: baseText.style?.merge(styleForAll),
        );
      }
    }).toList()));
  }
}
