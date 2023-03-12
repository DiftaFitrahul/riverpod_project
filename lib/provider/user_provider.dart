import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

class UserProvider extends StateNotifier<List<User>> {
  UserProvider() : super([]);

  List<User> temp = [];

  void addUser(
      {required String name, required String description, required int age}) {
    temp.add(User(name: name, description: description, age: age));
    final newList = state.toList()
      ..add(User(name: name, description: description, age: age));
    state = newList;
    // state = [...state, User()]
  }

  void deleteUser({required int index}) {
    final newList = state.toList()..removeAt(index);
    state = newList;
  }
}

final userStateProvider = StateNotifierProvider<UserProvider, List<User>>(
  (ref) => UserProvider(),
);
