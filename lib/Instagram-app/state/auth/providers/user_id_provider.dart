import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_state_provider.dart';
import '../../post/typedefs/user_id.dart';

// create userIdProvider
final userIdProvider =
    Provider<UserId?>((ref) => ref.watch(authStateNotifierProvider).userId);
