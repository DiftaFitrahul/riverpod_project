import 'dart:collection' show MapView;

import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod_project/Instagram-app/state/auth/constant/firebase_field_constant.dart';

import '../../post/typedefs/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String displayName,
    required String email,
  }) : super({
    FirebaseFieldConstant.userId : userId,
    FirebaseFieldConstant.displayName : displayName,
    FirebaseFieldConstant.email : email,
  });
}
