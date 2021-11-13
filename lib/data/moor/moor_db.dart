import 'package:moor_flutter/moor_flutter.dart';
import 'package:personal_manager/main.dart';
import 'package:personal_manager/models/models.dart';

part 'moor_db.g.dart';

class MoorNote extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get color => text()();
}

class MoorTask extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

class MoorAppointment extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get apptTime => dateTime()();
}

@UseMoor(
    tables: [MoorNote, MoorTask, MoorAppointment],
    daos: [NoteDao, TaskDao, AppointmentDao])
class PersonalManagerDatabase extends _$PersonalManagerDatabase {
  PersonalManagerDatabase._()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'pm.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  static final PersonalManagerDatabase instance = PersonalManagerDatabase._();

  factory PersonalManagerDatabase() => instance;
}

@UseDao(tables: [MoorNote])
class NoteDao extends DatabaseAccessor<PersonalManagerDatabase>
    with _$NoteDaoMixin {
  final PersonalManagerDatabase db;
  NoteDao(this.db) : super(db);

  Future<List<MoorNoteData>> findAllNotes() => select(moorNote).get();

  Stream<List<Note>> watchAllNotes() {
    return select(moorNote).watch().map((rows) {
      final notes = <Note>[];
      for (var row in rows) {
        final note = moorNoteToNote(row);
        if (!notes.contains(note)) {
          notes.add(note);
        }
      }
      return notes;
    });
  }

  Future<List<MoorNoteData>> findNoteById(int id) =>
      (select(moorNote)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> insertNote(Insertable<MoorNoteData> note) =>
      into(moorNote).insert(note);

  Future<bool> updateNote(Insertable<MoorNoteData> note) =>
      update(moorNote).replace(note);

  Future deleteNote(int id) =>
      Future.value((delete(moorNote)..where((tbl) => tbl.id.equals(id))).go());
}

@UseDao(tables: [MoorTask])
class TaskDao extends DatabaseAccessor<PersonalManagerDatabase>
    with _$TaskDaoMixin {
  final PersonalManagerDatabase db;
  TaskDao(this.db) : super(db);

  Future<List<MoorTaskData>> findAllTasks() => select(moorTask).get();

  Stream<List<Task>> watchAllTasks() {
    return select(moorTask).watch().map((rows) {
      final tasks = <Task>[];
      for (var row in rows) {
        final task = moorTaskToTask(row);
        if (!tasks.contains(task)) {
          tasks.add(task);
        }
      }
      return tasks;
    });
  }

  Future<List<MoorTaskData>> findTaskById(int id) =>
      (select(moorTask)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> insertTask(Insertable<MoorTaskData> task) =>
      into(moorTask).insert(task);

  Future<bool> updateTask(Insertable<MoorTaskData> task) =>
      update(moorTask).replace(task);

  Future deleteTask(int id) =>
      Future.value((delete(moorTask)..where((tbl) => tbl.id.equals(id))).go());
}

@UseDao(tables: [MoorAppointment])
class AppointmentDao extends DatabaseAccessor<PersonalManagerDatabase>
    with _$AppointmentDaoMixin {
  final PersonalManagerDatabase db;
  AppointmentDao(this.db) : super(db);

  Future<List<MoorAppointmentData>> findAllAppointments() =>
      select(moorAppointment).get();

  Stream<List<Appointment>> watchAllAppointments() {
    return select(moorAppointment).watch().map((rows) {
      final appointments = <Appointment>[];
      for (var row in rows) {
        final appt = moorAppointmentToAppointment(row);
        if (!appointments.contains(appt)) {
          appointments.add(appt);
        }
      }
      return appointments;
    });
  }

  Future<List<MoorAppointmentData>> findAppointmentById(int id) =>
      (select(moorAppointment)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> insertAppointment(Insertable<MoorAppointmentData> appointment) =>
      into(moorAppointment).insert(appointment);

  Future<bool> updateAppointment(Insertable<MoorAppointmentData> appointment) =>
      update(moorAppointment).replace(appointment);

  Future deleteAppointment(int id) => Future.value(
      (delete(moorAppointment)..where((tbl) => tbl.id.equals(id))).go());
}

Note moorNoteToNote(MoorNoteData note) {
  return Note(
      id: note.id, title: note.title, content: note.content, color: note.color);
}

Task moorTaskToTask(MoorTaskData task) {
  return Task(
    id: task.id,
    description: task.description,
    dueDate: task.dueDate!,
    completed: task.completed,
  );
}

Appointment moorAppointmentToAppointment(MoorAppointmentData appointment) {
  return Appointment(
      id: appointment.id,
      title: appointment.title,
      description: appointment.description,
      apptTime: appointment.apptTime);
}

Insertable<MoorNoteData> noteToInsertableMoorNote(Note note) {
  final moorNoteCompanion = MoorNoteCompanion.insert(
    title: note.title,
    content: note.content,
    color: note.color,
  );
  if (note.id == null) {
    return moorNoteCompanion;
  } else {
    return moorNoteCompanion.copyWith(id: Value(note.id!));
  }
}

Insertable<MoorTaskData> taskToInsertableMoorTask(Task task) {
  final moorTaskCompanion = MoorTaskCompanion.insert(
    description: task.description,
    completed: Value(task.completed),
    dueDate: Value(task.dueDate),
  );
  if (task.id == null) {
    return moorTaskCompanion;
  } else {
    return moorTaskCompanion.copyWith(id: Value(task.id!));
  }
}

Insertable<MoorAppointmentData> appointmentToInsertableMoorAppointment(
    Appointment appointment) {
  final moorAppointmentCompanion = MoorAppointmentCompanion.insert(
    title: appointment.title,
    description: appointment.description,
    apptTime: appointment.apptTime,
  );
  if (appointment.id == null) {
    return moorAppointmentCompanion;
  } else {
    return moorAppointmentCompanion.copyWith(id: Value(appointment.id!));
  }
}
