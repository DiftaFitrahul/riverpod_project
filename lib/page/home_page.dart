import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/page/add_user.dart';
import 'package:riverpod_project/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of User'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const AddUser()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          List listUser = ref.watch(userStateProvider);
          return listUser.isEmpty
              ? Center(
                  child: ElevatedButton(
                    child: const Text("Add new User"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const AddUser()));
                    },
                  ),
                )
              : ListView.builder(
                  itemCount: listUser.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(listUser[index].name),
                    subtitle: Text(listUser[index].description),
                    leading: Text(listUser[index].age.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(userStateProvider.notifier)
                              .deleteUser(index: index);
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                );
        },
      ),
    );
  }
}
