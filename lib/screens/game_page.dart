import 'package:flutter/material.dart';
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
  void _incrementCounter() {
    setState(() {
      int _counter = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wer hat zuletzt..?'),
      ),
      body: Center(
          child: FutureBuilder<Question>(
              future: SqliteService.instance.randomQuesteion(context),
              builder:
                  (BuildContext context, AsyncSnapshot<Question> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                }
                return Center(
                    child: Text(
                  snapshot.data!.german,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ));
              })),
      floatingActionButton: Container(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
              child: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            child: const Icon(Icons.arrow_forward),
          ))),
    );
  }
}