import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wer_hat_zuletzt/models/question.dart';
import 'package:wer_hat_zuletzt/sql_service.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePage();
}

// exactly one random quesionn
class _GamePage extends State<GamePage> {
  //just for updating the page

  int counter = 5;
  Timer? timer;

  void decrementCounter() {
    setState(
      () {
        if (counter > 0) {
          counter--;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setCountdown();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      decrementCounter();
    });
  }

  void stopTimer() {}

  void resetTimer() {
    counter = 0;
  }

  void setCountdown() {
    counter = 5;
    Provider.of<SqliteService>(context, listen: false).randomQuestion(context);
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wer hat zuletzt..?'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const SizedBox(height: 20),
        Consumer<SqliteService>(builder: (context, provider, child) {
          return provider.randQuestion.german != ""
              ? Text(provider.randQuestion.german)
              : const Text("Laden...");
        }),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            "$counter",
            style: const TextStyle(
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          )
        ]),
      ])),
      floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
              child: FloatingActionButton(
            onPressed: setCountdown,
            tooltip: 'Increment',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            child: const Icon(Icons.arrow_forward),
          ))),
    );
  }
}
