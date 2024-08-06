import 'package:NotedUp/cubit/Note.cubit.dart';
import 'package:NotedUp/models/Group.model.dart';
import 'package:NotedUp/ui/list/NoteListView.dart';
import 'package:NotedUp/ui/widget/BottomNoteModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GroupNotePage extends StatelessWidget {
  final Group group;

  const GroupNotePage({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Text(group.name), // You can customize this title
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // edit
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Go to the edit group page
              GoRouter.of(context).push('/add-group', extra: group);
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
                groupQuery: group,
                onLongPress: (note) {
                  // Go to the edit note page
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomNoteModal(
                        note: note,
                        children: [
                          ListTile(
                            leading:
                                const Icon(Icons.group, color: Colors.black),
                            title: const Text('Remove from group',
                                style: TextStyle(color: Colors.black)),
                            onTap: () {
                              // cubit remove note from group
                              context
                                  .read<NoteCubit>()
                                  .removeFromGroup(note, group);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100, // Adjust the height as needed
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0), // Fade out effect
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
