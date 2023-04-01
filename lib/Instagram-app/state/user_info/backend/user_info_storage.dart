import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod_project/Instagram-app/state/auth/constant/firebase_collection_name.dart';
import 'package:riverpod_project/Instagram-app/state/auth/constant/firebase_field_constant.dart';
import 'package:riverpod_project/Instagram-app/state/post/typedefs/user_id.dart';
import 'package:riverpod_project/Instagram-app/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> userInfoStorage({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try{
      // firsr check if the user is already registered
    final infoUser = await FirebaseFirestore.instance
        .collection(FirebaseCollectionName.users)
        .where(FirebaseFieldConstant.userId, isEqualTo: userId)
        .limit(1)
        .get();
    // check is user is not empty
    if (infoUser.docs.isNotEmpty) {
      await infoUser.docs.first.reference.update({
        FirebaseFieldConstant.displayName: displayName,
        FirebaseFieldConstant.email: email ?? '',
      });
      return true;
    }

    final payload =
        UserInfoPayload(userId: userId, displayName: displayName, email: email ?? '');

    // if user is empty
    await FirebaseFirestore.instance
        .collection(FirebaseCollectionName.users)
        .add(payload);
    return true;
    }catch(e){
      return false;
    }
  }
}
