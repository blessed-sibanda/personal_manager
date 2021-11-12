import 'package:flutter/material.dart';
import 'package:personal_manager/data/managers/notes_manager.dart';
import 'package:personal_manager/widgets/notes/notes_entry.dart';
import 'package:personal_manager/widgets/notes/notes_list.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesManager>(
      builder: (context, notesManager, child) {
        return IndexedStack(
          index: notesManager.screen,
          children: const [NotesList(), NotesEntry()],
        );
      },
    );
  }
}
