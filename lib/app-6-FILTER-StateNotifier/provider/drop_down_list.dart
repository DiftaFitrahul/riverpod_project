import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropDownProvider = Provider<List<String>>(
  (_) => ['all', 'favourites', 'non-favourites'],
);

final chooseProvider = StateProvider<String>(
  (ref) => ref.watch(dropDownProvider)[0],
);
