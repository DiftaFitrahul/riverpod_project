import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/page.dart';
import '../provider/page_provider.dart';

class ListViewPage extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Person>> provider;
  const ListViewPage({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listUserChoose = ref.watch(provider).toList();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: listUserChoose.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listUserChoose[index].title),
              subtitle: Text(listUserChoose[index].description),
              trailing: IconButton(
                  onPressed: () {
                    ref
                        .read(allPageStateProvider.notifier)
                        .changeFavorite(listUserChoose[index].id);
                  },
                  icon: listUserChoose[index].isFavorite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border)),
            );
          },
        ),
      ),
    );
  }
}
