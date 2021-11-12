import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:personal_manager/utils.dart' as utils;
import 'package:path/path.dart';

class DbTables {
  static const appointments = 'appointments';
  static const contacts = 'contacts';
  static const notes = 'notes';
  static const tasks = 'tasks';
}

class SqliteDatabaseHelper {
  static const _databaseName = 'personal_manager.db';
  static const _databaseVersion = 1;

  static BriteDatabase? _streamDatabase;

  // make this a singleton class
  SqliteDatabaseHelper._();
  static final SqliteDatabaseHelper instance = SqliteDatabaseHelper._();

  factory SqliteDatabaseHelper() => instance;

  static var lock = Lock();

  static Database? _database;

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DbTables.appointments} (

      )
    ''');

    await db.execute('''
      CREATE TABLE ${DbTables.contacts}(
        
      )
    ''');

    await db.execute('''
      CREATE TABLE ${DbTables.notes} (
        
      )
    ''');

    await db.execute('''
      CREATE TABLE ${DbTables.tasks} (
        
      )
    ''');
  }

  Future<Database> _initDatabase() {
    final path = join(utils.docsDir!.path, _databaseName);
    // TODO: Remember to turn off debugging before deploying app to store(s)
    Sqflite.setDebugModeOn(true);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    // prevent concurrent access to database
    await lock.synchronized(() async {
      _database = await _initDatabase();
      _streamDatabase = BriteDatabase(_database!);
    });
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase!;
  }

  void close() {
    _streamDatabase?.close();
  }
}
