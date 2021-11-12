import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_manager/data/managers/notes_manager.dart';
import 'package:personal_manager/data/repositories/repository.dart';
import 'package:personal_manager/models/notes_model.dart';
import 'package:personal_manager/utils.dart' as utils;
import 'package:provider/provider.dart';

class NotesEntry extends StatefulWidget {
  const NotesEntry({Key? key}) : super(key: key);

  @override
  _NotesEntryState createState() => _NotesEntryState();
}

class _NotesEntryState extends State<NotesEntry> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  Note _note = Note();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteManager = Provider.of<NotesManager>(context);
    final repository = Provider.of<Repository>(context);
    if (noteManager.selectedId != null) {
      repository
          .findNoteById(noteManager.selectedId!)
          .then((value) => _note = value);
    }
    return Consumer<NotesManager>(
      builder: (context, notesManager, child) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: [
                TextButton(
                    onPressed: () => noteManager.resetScreen(),
                    child: const Text('Cancel')),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      if (noteManager.selectedId == null) {
                        _note.title = _titleController.text;
                        _note.content = _contentController.text;
                        repository.insertNote(_note);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text('Note saved'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        // TODO: Update Note
                      }
                      noteManager.savedNote();
                      noteManager.resetScreen();
                    },
                    child: const Text('Save')),
              ],
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.title),
                  title: TextFormField(
                    decoration: const InputDecoration(hintText: 'Title'),
                    controller: _titleController,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Please enter a title';
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.content_paste),
                  title: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(hintText: 'Content'),
                    controller: _contentController,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Please enter content';
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: SizedBox(
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...utils.colors
                              .map((c) => _buildColorSelector(c))
                              .toList()
                        ],
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildColorSelector(String colorString) {
    Color color = utils.getColorFromString(colorString);
    return GestureDetector(
        child: Container(
            decoration: ShapeDecoration(
                shape: Border.all(width: 18, color: color) +
                    Border.all(
                        width: 5,
                        color: _note.color == colorString
                            ? color
                            : Theme.of(context).canvasColor))),
        onTap: () {
          setState(() {
            _note.color = colorString;
          });
        });
  }
}
