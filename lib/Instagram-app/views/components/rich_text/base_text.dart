import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show TextStyle, Colors, TextDecoration;

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  const BaseText({required this.text, this.style});

  factory BaseText.plainText({
    required String text,
    TextStyle? style = const TextStyle()
  }) => BaseText(text: text, style: style);
}
