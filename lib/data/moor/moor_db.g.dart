// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorNoteData extends DataClass implements Insertable<MoorNoteData> {
  final int id;
  final String title;
  final String content;
  final String color;
  MoorNoteData(
      {required this.id,
      required this.title,
      required this.content,
      required this.color});
  factory MoorNoteData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoorNoteData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      color: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['color'] = Variable<String>(color);
    return map;
  }

  MoorNoteCompanion toCompanion(bool nullToAbsent) {
    return MoorNoteCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      color: Value(color),
    );
  }

  factory MoorNoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorNoteData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'color': serializer.toJson<String>(color),
    };
  }

  MoorNoteData copyWith(
          {int? id, String? title, String? content, String? color}) =>
      MoorNoteData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('MoorNoteData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoorNoteData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.color == this.color);
}

class MoorNoteCompanion extends UpdateCompanion<MoorNoteData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> color;
  const MoorNoteCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.color = const Value.absent(),
  });
  MoorNoteCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required String color,
  })  : title = Value(title),
        content = Value(content),
        color = Value(color);
  static Insertable<MoorNoteData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (color != null) 'color': color,
    });
  }

  MoorNoteCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? color}) {
    return MoorNoteCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorNoteCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $MoorNoteTable extends MoorNote
    with TableInfo<$MoorNoteTable, MoorNoteData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoorNoteTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumn<String?> color = GeneratedColumn<String?>(
      'color', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, color];
  @override
  String get aliasedName => _alias ?? 'moor_note';
  @override
  String get actualTableName => 'moor_note';
  @override
  VerificationContext validateIntegrity(Insertable<MoorNoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorNoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoorNoteData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoorNoteTable createAlias(String alias) {
    return $MoorNoteTable(_db, alias);
  }
}

class MoorTaskData extends DataClass implements Insertable<MoorTaskData> {
  final int id;
  final String description;
  final DateTime? dueDate;
  final bool completed;
  MoorTaskData(
      {required this.id,
      required this.description,
      this.dueDate,
      required this.completed});
  factory MoorTaskData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoorTaskData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      dueDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime?>(dueDate);
    }
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  MoorTaskCompanion toCompanion(bool nullToAbsent) {
    return MoorTaskCompanion(
      id: Value(id),
      description: Value(description),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completed: Value(completed),
    );
  }

  factory MoorTaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorTaskData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  MoorTaskData copyWith(
          {int? id, String? description, DateTime? dueDate, bool? completed}) =>
      MoorTaskData(
        id: id ?? this.id,
        description: description ?? this.description,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('MoorTaskData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, dueDate, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoorTaskData &&
          other.id == this.id &&
          other.description == this.description &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed);
}

class MoorTaskCompanion extends UpdateCompanion<MoorTaskData> {
  final Value<int> id;
  final Value<String> description;
  final Value<DateTime?> dueDate;
  final Value<bool> completed;
  const MoorTaskCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  });
  MoorTaskCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  }) : description = Value(description);
  static Insertable<MoorTaskData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<DateTime?>? dueDate,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (dueDate != null) 'due_date': dueDate,
      if (completed != null) 'completed': completed,
    });
  }

  MoorTaskCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<DateTime?>? dueDate,
      Value<bool>? completed}) {
    return MoorTaskCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime?>(dueDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorTaskCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $MoorTaskTable extends MoorTask
    with TableInfo<$MoorTaskTable, MoorTaskData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoorTaskTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  late final GeneratedColumn<DateTime?> dueDate = GeneratedColumn<DateTime?>(
      'due_date', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  late final GeneratedColumn<bool?> completed = GeneratedColumn<bool?>(
      'completed', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completed IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, description, dueDate, completed];
  @override
  String get aliasedName => _alias ?? 'moor_task';
  @override
  String get actualTableName => 'moor_task';
  @override
  VerificationContext validateIntegrity(Insertable<MoorTaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorTaskData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoorTaskData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoorTaskTable createAlias(String alias) {
    return $MoorTaskTable(_db, alias);
  }
}

abstract class _$PersonalManagerDatabase extends GeneratedDatabase {
  _$PersonalManagerDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $MoorNoteTable moorNote = $MoorNoteTable(this);
  late final $MoorTaskTable moorTask = $MoorTaskTable(this);
  late final NoteDao noteDao = NoteDao(this as PersonalManagerDatabase);
  late final TaskDao taskDao = TaskDao(this as PersonalManagerDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorNote, moorTask];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NoteDaoMixin on DatabaseAccessor<PersonalManagerDatabase> {
  $MoorNoteTable get moorNote => attachedDatabase.moorNote;
}
mixin _$TaskDaoMixin on DatabaseAccessor<PersonalManagerDatabase> {
  $MoorTaskTable get moorTask => attachedDatabase.moorTask;
}
