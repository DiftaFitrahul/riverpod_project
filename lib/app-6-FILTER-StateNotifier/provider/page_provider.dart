import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/page.dart';

class PageProvider extends StateNotifier<List<Person>> {
  PageProvider()
      : super([
          Person(
            id: 1,
            title: 'Difta',
            description: 'makan',
            isFavorite: false,
          ),
          Person(
              id: 2,
              title: 'Fitrahul',
              description: 'makan',
              isFavorite: false),
          Person(
            id: 3,
            title: 'Qihaj',
            description: 'makan',
            isFavorite: false,
          ),
          Person(
            id: 4,
            title: 'Hafid',
            description: 'makan',
            isFavorite: false,
          ),
          Person(
            id: 5,
            title: 'Barka',
            description: 'makan',
            isFavorite: false,
          ),
          Person(
            id: 6,
            title: 'Amrullah',
            description: 'makan',
            isFavorite: false,
          )
        ]);

  void changeFavorite(int id) {
    state = state.map((user) {
      if (user.id == id) {
        user = user.isFavourite();
      }
      return user;
    }).toList();
  }
}

final allPageStateProvider = StateNotifierProvider<PageProvider, List<Person>>(
  (_) => PageProvider(),
);

final favoritePageProvider = Provider<Iterable<Person>>(
  (ref) => ref.watch(allPageStateProvider).where((page) => page.isFavorite),
);

final notFavouritePageProvider = Provider<Iterable<Person>>(
  (ref) => ref.watch(allPageStateProvider).where((page) => !page.isFavorite),
);
