import 'package:blog/delegates/NoteSearchDelegate.dart';
import 'package:blog/ui/list/NoteListView.dart';
import 'package:blog/ui/widget/BottomNoteModal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow/elevation
        title: const Text('Notes', style: TextStyle(color: Colors.black)),
        // leading: const Icon(
        //   Icons.notes,
        //   color: Colors.black,
        // ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Navigate to the add note page
              GoRouter.of(context).push('/add');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Show search bar
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(),
              );
            },
          )
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
        child: Stack(
          children: [
            NoteListView(
              onLongPress: (note) {
                // Show bottom modal to edit note
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomNoteModal(
                      note: note,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
