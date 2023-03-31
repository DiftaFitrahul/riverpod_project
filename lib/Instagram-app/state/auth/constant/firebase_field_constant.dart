import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod_project/Instagram-app/state/post/typedefs/user_id.dart';

@immutable
class FirebaseFieldConstant{
  static const userId = 'uid';
  static const postId = 'post_id';
  static const comment = 'comment';
  static const createdAt = 'created_at';
  static const date = 'date';
  static const displayName = 'display_name';
  static const email = 'email';
  const FirebaseFieldConstant._();
}