import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:personal_manager/data/managers/managers.dart';
import 'package:personal_manager/data/moor/moor_repository.dart';
import 'package:personal_manager/data/repositories/repository.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  _setupLogging();
  runApp(PersonalManager(
    repository: MoorRepository(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    // ignore: avoid_print
    print('${event.level.name}: ${event.time}: ${event.message}');
  });
}

class PersonalManager extends StatefulWidget {
  final Repository repository;

  const PersonalManager({Key? key, required this.repository}) : super(key: key);

  @override
  State<PersonalManager> createState() => _PersonalManagerState();
}

class _PersonalManagerState extends State<PersonalManager> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          create: (_) => widget.repository,
          lazy: false,
          dispose: (_, Repository repository) => repository.close(),
        ),
        ChangeNotifierProvider<NotesManager>(
            create: (context) => NotesManager()),
        ChangeNotifierProvider<TasksManager>(
            create: (context) => TasksManager()),
        ChangeNotifierProvider<AppointmentsManager>(
            create: (context) => AppointmentsManager()),
      ],
      child: MaterialApp(
        title: 'Personal Manager',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const Home(),
      ),
    );
  }
}
