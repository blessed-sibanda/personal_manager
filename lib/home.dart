import 'package:flutter/material.dart';
import 'package:personal_manager/screens/appointments_screen.dart';
import 'package:personal_manager/screens/notes_screen.dart';
import 'package:personal_manager/screens/contacts_screen.dart';
import 'package:personal_manager/screens/tasks_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          children: [
            AppointmentsScreen(),
            ContactsScreen(),
            NotesScreen(),
            TasksScreen(),
          ],
        ),
      ),
    );
  }
}
