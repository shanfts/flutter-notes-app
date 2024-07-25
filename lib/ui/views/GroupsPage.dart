import 'package:blog/ui/list/GroupListVIew.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: const Icon(
          Icons.tag,
          color: Colors.black,
        ),
        title: const Text('Groups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              GoRouter.of(context).push('/add-group');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 234, 199, 199),
              Color.fromARGB(255, 181, 188, 243),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GroupListVIew(
          onTap: (group) {
            GoRouter.of(context).push('/group', extra: group);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   foregroundColor: Colors.white,
      //   onPressed: () {
      //     // Go to the create group page
      //     GoRouter.of(context).push('/add-group');
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
