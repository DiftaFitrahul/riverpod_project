import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app-6-FILTER-StateNotifier/Page/listview_page_component.dart';
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
              final chooseDropDown = ref.watch(chooseProvider);
              switch (chooseDropDown) {
                case 'favourites':
                  return ListViewPage(provider: favoritePageProvider);
                case 'non-favourites':
                  return ListViewPage(provider: notFavouritePageProvider);
                default:
                  return ListViewPage(provider: allPageStateProvider);
              }
            })
          ],
        ),
      )),
    );
  }
}
