import 'package:flutter/material.dart';
import 'package:personal_manager/data/managers/notes_manager.dart';
import 'package:personal_manager/data/repositories/repository.dart';
import 'package:personal_manager/models/notes_model.dart';
import 'package:personal_manager/utils.dart';
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
    return StreamBuilder(
      stream: repository.watchAllNotes(),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        final notes = snapshot.data;

        if (notes == null) {
          return Container();
        }

        print('$notes');

        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext contex, int index) {
              Note note = notes[index];
              return Card(
                elevation: 8,
                // TODO: Use actual note color
                color: getColorFromString(note.color!),
                child: ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  onTap: () {},
                ),
              );
            });
      },
    );
  }
}
