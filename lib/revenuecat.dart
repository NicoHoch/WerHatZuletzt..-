import 'package:flutter/cupertino.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'package:wer_hat_zuletzt/globals.dart' as globals;
import 'models/entitlement.dart';

class RevenueCatProvider with ChangeNotifier {
  RevenueCatProvider() {
    init();
  }

  Entitlement _entitlement = Entitlement.free;
  Entitlement get entitlement => _entitlement;

  Future init() async {
    Purchases.addCustomerInfoUpdateListener((customerInfo) async {
      updatePurchaseStatus();
    });
  }

  Future updatePurchaseStatus() async {
    final purchaseInfo = await Purchases.getCustomerInfo();

    final entitlements = purchaseInfo.entitlements.active.values.toList();
    _entitlement = entitlements.isEmpty ? Entitlement.free : Entitlement.class1;

    notifyListeners();
  }

  Future restorePurchaseStatus() async {
    try {
      var restoredInfo = await Purchases.restorePurchases();
      final entitlements = restoredInfo.entitlements.active.values.toList();
      _entitlement =
          entitlements.isEmpty ? Entitlement.free : Entitlement.class1;

      notifyListeners();
    } on Error catch (e) {
      _entitlement = Entitlement.free;
      globals.restorePurchaseFlag = false;
    }
  }
}
