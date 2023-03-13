import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> data = [];

  void addUser(User user) {
    data.add(user);
    notifyListeners();
  }

  void deleteUser(int index) {
    data.removeAt(index);
    notifyListeners();
  }
}

final userProvider =
    ChangeNotifierProvider<UserProvider>((ref) => UserProvider());
