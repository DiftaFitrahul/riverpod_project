import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/CRUD_changenotifier/model/user.dart';

import '../provider/user_provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'description'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(hintText: 'age'),
            ),
            const SizedBox(
              height: 100,
            ),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          _descriptionController.text.isEmpty ||
                          _ageController.text.isEmpty) {
                        return;
                      } else {
                        ref.read(userProvider.notifier).addUser(User(
                            name: _nameController.text,
                            description: _descriptionController.text,
                            age: int.parse(_ageController.text)));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add User'));
              },
            )
          ],
        ),
      ),
    );
  }
}
