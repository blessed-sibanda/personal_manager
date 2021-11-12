import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:personal_manager/data/managers/notes_manager.dart';
import 'package:personal_manager/data/repositories/repository.dart';
import 'package:personal_manager/models/notes_model.dart';
import 'package:personal_manager/utils.dart' as utils;
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesManager = Provider.of<NotesManager>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          notesManager.addNote();
        },
      ),
      body: _buildNotesList(context),
    );
  }

  Widget _buildNotesList(BuildContext context) {
    final repository = Provider.of<Repository>(context);
    final notesManager = Provider.of<NotesManager>(context);
    return StreamBuilder(
      stream: repository.watchAllNotes(),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        final notes = snapshot.data;

        if (notes == null) {
          return Container();
        }

        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext contex, int index) {
              Note note = notes[index];
              return Slidable(
                key: ValueKey(note.id),
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {
                    repository.deleteNote(note);
                  }),
                  children: [
                    SlidableAction(
                      onPressed: (_) => repository.deleteNote(note),
                      backgroundColor: Theme.of(context).canvasColor,
                      foregroundColor: Colors.red,
                      icon: Icons.delete,
                      label: 'Delete',
                    )
                  ],
                ),
                child: Card(
                  // elevation: 2,
                  color: utils.getColorFromString(note.color).withOpacity(0.5),
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.content),
                    onTap: () {
                      notesManager.editNote(note.id!);
                    },
                  ),
                ),
              );
            });
      },
    );
  }
}
