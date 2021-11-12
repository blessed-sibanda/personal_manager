import 'package:flutter/material.dart';
import 'package:personal_manager/data/managers/notes_manager.dart';
import 'package:personal_manager/widgets/notes/notes_entry.dart';
import 'package:personal_manager/widgets/notes/notes_list.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  final pages = const [NotesList(), NotesEntry()];

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesManager>(
      builder: (context, notesManager, child) {
        final index = notesManager.screen;
        return pages[index];
      },
    );
  }
}
