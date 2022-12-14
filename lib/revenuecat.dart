import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'package:wer_hat_zuletzt/questions_service.dart';
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
    QuestionsService.instance.setFlag();

    notifyListeners();
  }

  Future restorePurchaseStatus() async {
    try {
      var restoredInfo = await Purchases.restorePurchases();
      final entitlements = restoredInfo.entitlements.active.values.toList();
      _entitlement =
          entitlements.isEmpty ? Entitlement.free : Entitlement.class1;

      notifyListeners();
    } on PlatformException catch (e) {
      _entitlement = Entitlement.free;
    }
  }
}
