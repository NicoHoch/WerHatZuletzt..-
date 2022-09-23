import 'package:flutter/material.dart';
import 'dart:math';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'questions_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE questions(id INTEGER PRIMARY KEY, name TEXT, free BOOLEAN)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );


  Future<void> insertQuestion(Question question) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'questions',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var fido = const Question(
    id: 0,
    name: 'Fido',
    free: false,
  );

  await insertQuestion(fido);



}

class Question {
  final int id;
  final String name;
  final bool free;

  const Question({
    required this.id,
    required this.name,
    required this.free,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'free': free,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Question{id: $id, name: $name, free: $free}';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wer hat zuletzt..?',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF9C27B0),
                              Color.fromARGB(255, 209, 64, 234),
                              Color.fromARGB(255, 208, 101, 226),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GamePage()),
                        );
                      },
                      child: const Text('Los!'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF9C27B0),
                              Color.fromARGB(255, 209, 64, 234),
                              Color.fromARGB(255, 208, 101, 226),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RulesPage()),
                        );
                      },
                      child: const Text('Spielregeln'),
                    ),
                  ],
                ),
              ),
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

class _GamePage extends State<GamePage> {
  final Set<String> _questions = {
    "Wer hat sich zuletzt etwas gebrochen?",
    "Wer hat sich zuletzt etwas total unnötiges gekauft?",
    "Wer hat sich zuletzt ein neues Handy gekauft?",
    "Wer hatte zuletzt einen Sonnenbrand?",
    "Wer hatte zuletzt Geburtstag?",
    "Wer hatte zuletzt ein Brainfreeze?",
    "Wer hat zuletzt ein Buch fertig gelesen?",
    "Wer hat zuletzt Spaghetti gegessen?",
    "Wer hat zuletzt mit den Eltern geredet?",
    "Wer hat zuletzt verschlafen?",
    "Wer hat zuletzt etwas online bestellt?",
    "Wer hat zuletzt Sport gemacht?",
    "Wer hat zuletzt etwas gekocht?",
    "Wer hat zuletzt einen Brief von Hand geschrieben?",
    "Wer hat zuletzt bei einem Umzug geholfen?",
    "Wer hat zuletzt die Wohnung geputzt?",
    "Wer hat zuletzt einen Promi gesehen?",
    "Wer hat zuletzt eine Straftat beobachtet?",
    "Wer hat zuletzt einen Purzelbaum gemacht?",
    "Wer hat zuletzt Blut gespendet?",
    "Wer hat zuletzt das Bett neu bezogen?",
    "Wer hat zuletzt eine Serie zu Ende geschaut?",
    "Wer hat zuletzt ein Feuer gemacht?",
    "Wer hat zuletzt gegrillt?",
    "Wer hat zuletzt einen Mittagsschlaf gemacht?",
    "Wer hat zuletzt Bargeld abgehoben?",
    "Wer hat zuletzt auf einem Instrument gespielt?",
    "Wer hat zuletzt einen 'Tatort' im Ersten gesehen?",
    "Wer hat zuletzt eine Schallplatte gehört?",
    "Wer hat zuletzt bei einer Renovierung geholfen?",
    "Wer hat zuletzt ein Blatt gelocht?",
    "Wer hat zuletzt einen Social-Media-Post veröffentlicht?",
    "Wer hat zuletzt Kaffee getrunken?",
    "Wer hat zuletzt Erdbeeren gegessen?",
    "Wer hat zuletzt Geld gefunden?",
    "Wer hat zuletzt an eine NGO gespendet?",
    "Wer hat zuletzt etwas kaputt gemacht?",
    "Wer hat zuletzt eine Glühbirne gewechselt?",
    "Wer hat zuletzt ein Glas umgeschüttet?",
    "Wer hat zuletzt die Nacht durchgemacht?",
    "Wer hat zuletzt Pizza gegessen?",
    "Wer hat zuletzt ein Kleidungsstück gekauft?",
    "Wer hat zuletzt ein Brettspiel gespielt?",
    "Wer hat zuletzt ein Disneyfilm gesehen?",
    "Wer war zuletzt im Ausland?",
    "Wer war zuletzt auf einem Konzert?",
    "Wer war zuletzt in einem Fast-Food-Restaurant?",
    "Wer war zuletzt auf einer Hochzeit?",
    "Wer war zuletzt im Kino?",
    "Wer war zuletzt auf einer Demo?",
    "Wer war zuletzt in der Kirche?",
    "Wer war zuletzt beim Friseur?",
    "Wer war zuletzt krank?",
    "Wer war zuletzt im Theater?",
    "Wer war zuletzt auf einem Festival?",
    "Wer war zuletzt im Schwimmbad?",
    "Wer war zuletzt zelten?",
    "Wer war zuletzt im Baumarkt?",
    "Wer war zuletzt in einem ICE?",
    "Wer war zuletzt im Wald?",
    "Wer war zuletzt in einem Flugzeug?",
    "Wer war zuletzt in einer Polizeikontrolle?",
    "Wer war zuletzt im Club?",
    "Wer war zuletzt im Museum?",
    "Wer ist zuletzt in Hundekacke getreten?",
    "Wer wurde zuletzt von Vogelexkrement getroffen?"
  };

  int _counter = 0;

  void _incrementCounter() {
    var rng = Random();
    setState(() {
      _counter = rng.nextInt(_questions.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    _incrementCounter();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wer hat zuletzt..?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _questions.elementAt(_counter),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward),
      ),
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
        body: ListView(
          children: const <Widget>[
            Card(
                child: ListTile(
                    title: Text(
              'Spielregeln',
            ))),
            Card(
              child: ListTile(
                title: Text(
                    'Ziel des Spiels ist es, sich besser kennenzulernen und lustige Geschichten auszutauschen. Die Punktevergabe bleibt euch selbst überlassen. Unten findet ihr ein Vorschlag, wie ihr es mit Wasser(!) spielen könnt.'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('1.'),
                title:
                    Text('Die Frage wird für jeden am Tisch laut vorgelesen.'),
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
        ));
  }
}
