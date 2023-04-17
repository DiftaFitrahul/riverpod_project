import 'package:flutter/material.dart' show immutable, VoidCallback;

import './base_text.dart';

@immutable
class LinkText extends BaseText {
  final VoidCallback callback;
  const LinkText({
    required super.text,
    required this.callback,
    super.style,
  });
}
