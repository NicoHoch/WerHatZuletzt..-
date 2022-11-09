import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wer_hat_zuletzt/revenuecat.dart';

import 'models/entitlement.dart';
import 'models/question.dart';

class QuestionsService with ChangeNotifier {
  QuestionsService() {}
  QuestionsService._privateConstructor();
  static final QuestionsService instance =
      QuestionsService._privateConstructor();

  static List<Question> _quesionListTemp = [];
  static bool _flag = false;
  Question randQuestion =
      new Question(german: "Viel Spaß!", english: "Loading", type: "free");

  //getQuestions
  Future<List<Question>> getQuestions(BuildContext context) {
    final entitlement =
        Provider.of<RevenueCatProvider>(context, listen: false).entitlement;

    if (entitlement == Entitlement.free) {
      return FirebaseFirestore.instance
          .collection('Questions3')
          .where('type', isEqualTo: 'free')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Question.fromJson(doc.data()))
              .toList())
          .first;
    } else {
      return FirebaseFirestore.instance
          .collection('Questions3')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Question.fromJson(doc.data()))
              .toList())
          .first;
    }
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
      randQuestion = const Question(
          german: "Das war\'s!", english: "Thats it!", type: "free");
    } else {
      _flag = true;

      int randIndex = 0;
      var rng = Random();
      randIndex = rng.nextInt(_quesionListTemp.length);

      randQuestion = _quesionListTemp[randIndex];
      _quesionListTemp.removeAt(randIndex);
    }
    notifyListeners();
  }
}
