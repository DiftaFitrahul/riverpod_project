import 'package:flutter/foundation.dart' show immutable;

import '../models/auth_result.dart';
import '../../post/typedefs/user_id.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });
}
