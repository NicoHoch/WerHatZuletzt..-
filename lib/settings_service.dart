import 'package:shared_preferences/shared_preferences.dart';
import 'package:wer_hat_zuletzt/globals.dart' as globals;

class SettingsService {
  static void setGlobalsPersistent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('timerToggle', globals.toggleTimer);
    await prefs.setDouble('timerValue', globals.timerValue);
    await prefs.setBool('restorePurchaseFlag', globals.restorePurchaseFlag);
  }

  static void getGlobalsPersistent() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? timerToggle = prefs.getBool('timerToggle');
    final double? timerValue = prefs.getDouble('timerValue');
    final bool? restorePurchaseFlag = prefs.getBool('restorePurchaseFlag');

    if (timerValue == null || timerValue == 0) {
      globals.timerValue = 5;
    } else {
      globals.timerValue = timerValue;
    }

    if (timerToggle == null) {
      globals.toggleTimer = true;
    } else {
      globals.toggleTimer = timerToggle;
    }
  }
}
