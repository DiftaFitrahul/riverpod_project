import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app-6-FILTER-StateNotifier/provider/drop_down_list.dart';
import 'package:riverpod_project/app-6-FILTER-StateNotifier/provider/page_provider.dart';

class HomePageApp6 extends StatelessWidget {
  const HomePageApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final listDropDown = ref.watch(dropDownProvider);

                return DropdownButton<String>(
                  value: ref.watch(chooseProvider),
                  items: listDropDown
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    ref.read(chooseProvider.notifier).state = value!;
                  },
                );
              },
            ),
            Consumer(builder: (context, ref, child) {
              final listUser = ref.watch(pageStateProvider);
              final filter = ref.watch(chooseProvider);
              List listUserChoose = [];
              if (filter == 'all') {
                listUserChoose = listUser;
              } else if (filter == 'favourites') {
                listUserChoose =
                    listUser.where((page) => page.isFavorite == true).toList();
              } else {
                listUserChoose =
                    listUser.where((page) => page.isFavorite == false).toList();
              }
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
                                  .read(pageStateProvider.notifier)
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
            })
          ],
        ),
      )),
    );
  }
}
