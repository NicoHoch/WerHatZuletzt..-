import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:wer_hat_zuletzt/models/entitlement.dart';
import 'package:wer_hat_zuletzt/revenuecat.dart';
import 'package:wer_hat_zuletzt/screens/rules_page.dart';

import 'package:wer_hat_zuletzt/globals.dart' as globals;
import 'package:wer_hat_zuletzt/settings_page.dart';

import 'package:wer_hat_zuletzt/questions_service.dart';
import 'package:wer_hat_zuletzt/purchase_api.dart';

import 'game_page/game_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoadeng = false;
  double _timerValue = globals.timerValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wer hat zuletzt..?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Icon(Icons.menu),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff42104a)),
                onPressed: () {
                  QuestionsService.instance.setFlag();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                },
                child: const Text('Los geht\'s!'),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff42104a)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RulesPage()),
                    );
                  },
                  child: const Text('Spielregeln')),
              const SizedBox(
                height: 40,
              ),
              Consumer<RevenueCatProvider>(
                builder: (context, provider, child) {
                  return provider.entitlement == Entitlement.free
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.amber),
                            ),
                          ),
                          onPressed: () => _fetchOffers(),
                          child: const Text(
                            'Jetzt noch mehr Fragen freischalten!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : const Text(
                          "??? Du nutzt die erweiterte Version ???",
                        );
                },
              ),
            ],
          ),
        ));
  }

  void _fetchOffers() async {
    final offerings = await PurchaseAPI.fetchOffers();

    if (offerings.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No Offers available!")));
    } else {
      final packages = offerings
          .map((offer) => offer.availablePackages)
          .expand((pair) => pair)
          .toList();

      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xff2F1134),
              height: 180,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 20),
                          child: Text(
                            '??? Upgrade deinen Spielspa??',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(6),
                          itemCount: packages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: GestureDetector(
                                onTap: () => buyPackage(packages[index]),
                                child: Card(
                                  color: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Theme(
                                    data: ThemeData.light(),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(8),
                                      title: Text(
                                        packages[index].storeProduct.title,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        packages[index]
                                            .storeProduct
                                            .description,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      trailing: Text(
                                        packages[index]
                                            .storeProduct
                                            .priceString,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      // onTap:
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ])),
            );
          });
    }
  }

  buyPackage(Package package) async {
    Navigator.pop(context);
    await PurchaseAPI.purchasePackage(package);
  }
}

// Animation for settings page
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SettingsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
