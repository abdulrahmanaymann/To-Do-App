import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('db not null');
      return;
    }
    try {
      String path = '${await getDatabasesPath()}task.db';
      debugPrint('in db path');
      _db = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        debugPrint('Creating new one');
        // When creating the db, create the table
        return db.execute('CREATE TABLE $_tableName ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title STRING, note TEXT, date STRING, '
            'startTime STRING, endTime STRING, '
            'remind INTEGER, repeat STRING, '
            'color INTEGER, '
            'isCompleted INTEGER)');
      });
      print('DB Created');
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert function called');
    try {
      return await _db!.insert(_tableName, task!.toJson());
    } catch (e) {
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      return 9000;
    }
  }

  static Future<int> delete(Task task) async {
    print('insert');
    return await _db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<int> deleteAll() async {
    print('insert');
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('Query Called!!!!!!!!!!!!!!!!!!!');
    print('insert');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    print('insert');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    ''', [1, id]);
  }
}
