import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:wer_hat_zuletzt/revenuecat.dart';

import 'package:wer_hat_zuletzt/purchase_api.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PurchaseAPI.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // RevenueCatProvider;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RevenueCatProvider>(
          create: (_) => RevenueCatProvider(),
        ),
      ],
      child: MaterialApp(
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
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15)))),
            cardTheme:
                const CardTheme(color: Colors.transparent, elevation: 0)),
        home: const MyHomePage(),
      ),
    );
  }
}
