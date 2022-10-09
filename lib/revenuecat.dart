import 'package:flutter/cupertino.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'models/entitlement.dart';

class RevenueCatProvider extends ChangeNotifier {
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
}
