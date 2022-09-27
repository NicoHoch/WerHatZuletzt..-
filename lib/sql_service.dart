import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models/question.dart';

class SqliteService {
  static const int _version = 1;
  static const String _name = "questions_database.db";

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _name),
      onCreate: (db, version) async => await db.execute(
          'CREATE TABLE questions(id INTEGER PRIMARY KEY, question TEXT, free BOOLEAN)'),
      version: _version,
    );
  }

  //Delete Database
  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  //InsertQuestion
  static Future<void> insertQuestion(Question question) async {
    final db = await _getDB();

    await db.insert(
      'questions',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //getQuestions
  static Future<List<String>?> getQuestions() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query('questions');

    if (maps.isEmpty) {
      return null;
    }
    ;

    // Convert the List<Map<String, dynamic> into a List<Question>.
    return List.generate(maps.length, (i) {
      return Question(
        id: maps[i]['id'],
        question: maps[i]['question'],
        free: maps[i]['free'] == 0 ? false : true,
      ).question.toString();
    });
  }
}
