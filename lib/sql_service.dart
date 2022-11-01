import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wer_hat_zuletzt/revenuecat.dart';

import 'models/entitlement.dart';
import 'models/question.dart';

class SqliteService with ChangeNotifier {
  SqliteService() {
    _initDatabase();
  }
  SqliteService._privateConstructor();
  static final SqliteService instance = SqliteService._privateConstructor();

  static Database? _database;
  static List<Question> _quesionListTemp = [];
  static bool _flag = false;
  Question randQuestion =
      new Question(german: "Laden...", english: "Loasing", type: "free");
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'question_database.db');
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      //Load db from assets folder
      ByteData data =
          await rootBundle.load(join('assets', 'questions_database.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    } else {
      deleteDatabase(path);
      ByteData data =
          await rootBundle.load(join('assets', 'questions_database.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }
    return openDatabase(path);
  }

  //Delete Database
  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  //InsertQuestion
  static Future<void> insertQuestion(Question question) async {
    final db = await instance._initDatabase();

    await db.insert(
      'questions',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //getQuestions
  Future<List<Question>> getQuestions(BuildContext context) async {
    final db = await instance.database;
    final entitlement =
        Provider.of<RevenueCatProvider>(context, listen: false).entitlement;
    final List<Map<String, dynamic>> questions;

    if (entitlement == Entitlement.free) {
      questions =
          await db.rawQuery('SELECT * FROM "Questions" WHERE "Type" == "free"');
    } else {
      questions = await db.rawQuery('SELECT * FROM "Questions"');
    }

    // Convert the List<Map<String, dynamic> into a List<Question>.
    return List.generate(questions.length, (i) {
      return Question(
          id: questions[i]['Id'],
          german: questions[i]['German'],
          english: questions[i]['English'],
          type: questions[i]['Type']);
    });
  }

  Future<void> setFlag() async {
    _flag = false;
    _quesionListTemp = [];
  }

  Future randomQuestion(BuildContext context) async {
    if (_quesionListTemp.isEmpty && _flag == false) {
      _quesionListTemp = await instance.getQuestions(context);
    }
    if (_quesionListTemp.isEmpty && _flag == true) {
      return const Question(
          german: "Das war\'s!", english: "Thats it!", type: "free");
    }
    _flag = true;

    int randIndex = 0;
    var rng = Random();
    randIndex = rng.nextInt(_quesionListTemp.length);

    randQuestion = _quesionListTemp[randIndex];
    _quesionListTemp.removeAt(randIndex);

    notifyListeners();
  }
}
