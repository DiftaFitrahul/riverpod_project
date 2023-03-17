import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/app-6-FILTER-StateNotifier/provider/drop_down_list.dart';

class HomePageApp6 extends StatelessWidget {
  const HomePageApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final listDropDown = ref.watch(dropDownProvider);
              return DropdownButton<String>(
                value: listDropDown.first,
                items: items,
                onChanged: onChanged,
              );
            },
          )
        ],
      )),
    );
  }
}
