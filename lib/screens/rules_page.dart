import 'package:flutter/material.dart';

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
                        'Ziel des Spiels ist es, sich besser kennenzulernen und lustige Geschichten auszutauschen. Die Punktevergabe bleibt euch selbst überlassen. Unten findet ihr einen Vorschlag, wie ihr es mit Wasser(!) spielen könnt.'),
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
                        'Jede Person überlegt für sich, ob sie diejenige ist, auf die die Frage zutrifft (Bezogen auf die Mitspielenden).'),
                  ),
                ),
                Card(
                    child: ListTile(
                  leading: Text('3.'),
                  title: Text(
                      'Es wird von einer beliebigen Zahl rückwärts gezählt. Bei null berühren alle Personen, die denken, sie sind diejenigen, auf die es zutrifft, die (eigene) Nasenspitze.'),
                )),
                Card(
                  child: ListTile(
                      leading: Text('4.'),
                      title: Text('Nun können folgende Szenarien auftreten:'),
                      subtitle: Text(
                          'Eine Person berührt die Nase: Diese Person darf nun entscheiden, wer zwei Schlücke trinkt.\nMehrere Personen berühren die Nase: Nun müsst ihr herausfinden, wer recht hat. Nur die Verlierer trinken drei Schlücke.\nNiemand berührt die Nase: Es hat sich niemand getraut? Alle trinken zwei Schlücke.')),
                ),
              ],
            )));
  }
}
