import 'package:NotedUp/ui/list/GroupListVIew.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
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
        child: Column(
          children: [
            Expanded(
              child: GroupListVIew(
                onTap: (group) {
                  GoRouter.of(context).push('/group', extra: group);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
