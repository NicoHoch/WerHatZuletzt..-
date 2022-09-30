import 'package:flutter/material.dart';
import 'package:wer_hat_zuletzt/models/question.dart';
import 'package:flutter/services.dart';

import 'package:wer_hat_zuletzt/sql_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Wer hat zuletzt..?',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              fontSizeFactor: 1.5),
          colorSchemeSeed: const Color(0xFFb93abb),
          backgroundColor: const Color(0xFFb93abb),
          scaffoldBackgroundColor: const Color(0xFF662572),
          appBarTheme: const AppBarTheme(color: Color(0xFF42104a)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(300, 3)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFFb93abb).withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                  textStyle: MaterialStateProperty.resolveWith(
                      (states) => Theme.of(context).textTheme.headline4),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15)))),
          cardTheme: const CardTheme(color: Colors.transparent, elevation: 0)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wer hat zuletzt?"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff42104a)),
                onPressed: () {
                  SqliteService.instance.setFlag();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                },
                child: const Text('Los gehts!'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff42104a)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RulesPage()),
                    );
                  },
                  child: const Text('Spielregeln')),
            ],
          ),
        ));
  }
}

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
              future: SqliteService.instance.randomQuesteion,
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

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wer hat zuletzt..?'),
        ),
        body: Container(
            color: Color(0x662572),
            child: ListView(
              children: const <Widget>[
                Card(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        'Spielregeln',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    )),
                Card(
                  child: ListTile(
                    title: Text(
                        'Ziel des Spiels ist es, sich besser kennenzulernen und lustige Geschichten auszutauschen. Die Punktevergabe bleibt euch selbst überlassen. Unten findet ihr ein Vorschlag, wie ihr es mit Wasser(!) spielen könnt.'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text('1.'),
                    title: Text(
                        'Die Frage wird für jeden am Tisch laut vorgelesen.'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text('2.'),
                    title: Text(
                        'Jede Person überlegt für sich, ob sie diejenige ist, auf die die Frage zutrifft. (Also im Vergleich zu den Mitspielenden.)'),
                  ),
                ),
                Card(
                    child: ListTile(
                  leading: Text('3.'),
                  title: Text(
                      'Es wird von drei rückwärts gezählt und alle Personen, die denken, sie sind diejenigen, auf die es zutrifft, berühren die (eigene) Nasenspitze.'),
                )),
                Card(
                  child: ListTile(
                      leading: Text('4.'),
                      title: Text('Nun können folgende Szenarien auftreten:'),
                      subtitle: Text(
                          'Eine Person berührt die Nase: Diese Person darf nun entscheiden, wer 2 Schlücke trinkt.\nMehrere Personen berühren die Nase: Nun müsst ihr herausfinden, wer recht hat. Nur die Verlierer trinken 3 Schlücke.\nNiemand berührt die Nase: Es hat sich niemand getraut? Alle trinken 2 Schlücke.')),
                ),
              ],
            )));
  }
}
