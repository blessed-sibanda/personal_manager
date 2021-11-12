import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'contacts/contacts.dart';
import 'appointments/appointments.dart';
import 'notes/notes.dart';
import 'tasks/tasks.dart';
import 'utils.dart' as utils;

void main() {
  runApp(const PersonalManager());
}

class PersonalManager extends StatefulWidget {
  const PersonalManager({Key? key}) : super(key: key);

  @override
  State<PersonalManager> createState() => _PersonalManagerState();
}

class _PersonalManagerState extends State<PersonalManager> {
  void initDocs() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    utils.docsDir = docsDir;
  }

  @override
  void initState() {
    initDocs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Personal Manager'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.date_range), text: 'Appointments'),
                Tab(icon: Icon(Icons.contacts), text: 'Contacts'),
                Tab(icon: Icon(Icons.note), text: 'Notes'),
                Tab(icon: Icon(Icons.assignment_turned_in), text: 'Tasks'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [Appointments(), Contacts(), Notes(), Tasks()],
          ),
        ),
      ),
    );
  }
}
