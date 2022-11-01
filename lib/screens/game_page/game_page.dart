import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wer_hat_zuletzt/sql_service.dart';

import 'package:wer_hat_zuletzt/globals.dart' as globals;

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePage();
}

// exactly one random quesionn
class _GamePage extends State<GamePage> {
  int counter = 5;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    nextQuestion();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      decrementCounter();
    });
  }

  void decrementCounter() {
    setState(
      () {
        if (counter > 0) {
          counter--;
        }
      },
    );
  }

  void nextQuestion() {
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
        const SizedBox(height: 80),
        Consumer<SqliteService>(builder: (context, provider, child) {
          return provider.randQuestion.german != ""
              ? Text(
                  provider.randQuestion.german,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                )
              : const Text("");
        }),
        if (globals.toggleTimer == true)
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$counter",
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                )
              ]),
      ])),
      floatingActionButton: SizedBox(
          height: 90.0,
          width: 90.0,
          child: FittedBox(
              child: FloatingActionButton(
            onPressed: nextQuestion,
            tooltip: 'Increment',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            child: const Icon(Icons.arrow_forward),
          ))),
    );
  }
}
