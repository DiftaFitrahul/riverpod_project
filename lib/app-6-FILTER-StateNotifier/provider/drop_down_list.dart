import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropDownProvider = StateProvider<List<String>>(
  (_) => ['all', 'favourites', 'non-favourites'],
);
