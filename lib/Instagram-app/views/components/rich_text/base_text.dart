import 'package:flutter/foundation.dart' show VoidCallback, immutable;
import 'package:flutter/material.dart' show TextStyle, Colors, TextDecoration;
import 'package:riverpod_project/Instagram-app/views/components/rich_text/link_text.dart';

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  const BaseText({required this.text, this.style});

  factory BaseText.plainText(
          {required String text, TextStyle? style = const TextStyle(color: Colors.black)}) =>
      BaseText(text: text, style: style);

  factory BaseText.linkText({
    required String text,
    required VoidCallback onTapped,
    TextStyle? style = const TextStyle(
        color: Colors.blue, decoration: TextDecoration.underline),
  }) =>
      LinkText(
        text: text,
        callback: onTapped,
        style: style,
      );
}
