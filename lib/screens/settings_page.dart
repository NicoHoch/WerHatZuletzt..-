import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:wer_hat_zuletzt/globals.dart' as globals;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wer hat zuletzt..?'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(113, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Timer: "),
                        ToggleSwitch(
                          minWidth: 90.0,
                          initialLabelIndex:
                              globals.toggleTimer == true ? 0 : 1,
                          cornerRadius: 20.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['Ein', 'Aus'],
                          icons: const [
                            Icons.timer_outlined,
                            Icons.timer_off_outlined
                          ],
                          activeBgColors: const [
                            [Colors.blue],
                            [Colors.pink]
                          ],
                          onToggle: (index) {
                            index == 1
                                ? setState(() {
                                    globals.toggleTimer = false;
                                  })
                                : setState(() {
                                    globals.toggleTimer = true;
                                  });
                          },
                        )
                      ]))),
          if (globals.toggleTimer)
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(113, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dauer des Timers in Sekunden: "),
                          Slider(
                              value: globals.timerValue,
                              min: 0,
                              max: 30,
                              divisions: 6,
                              label: globals.timerValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  globals.timerValue = value;
                                });
                              }),
                        ])))
        ],
      ),
    );
  }
}
