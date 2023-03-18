import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/page.dart';

class PageProvider extends StateNotifier<List<Page>> {
  PageProvider()
      : super([
          Page(
            id: 1,
            title: 'Difta',
            description: 'makan',
            isFavorite: false,
          ),
          Page(
              id: 2,
              title: 'Fitrahul',
              description: 'makan',
              isFavorite: false),
          Page(
            id: 3,
            title: 'Qihaj',
            description: 'makan',
            isFavorite: false,
          ),
          Page(
            id: 4,
            title: 'Hafid',
            description: 'makan',
            isFavorite: false,
          ),
          Page(
            id: 5,
            title: 'Barka',
            description: 'makan',
            isFavorite: false,
          ),
          Page(
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

final pageStateProvider = StateNotifierProvider<PageProvider, List<Page>>(
  (_) => PageProvider(),
);
