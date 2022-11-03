import 'package:shared_preferences/shared_preferences.dart';
import 'package:wer_hat_zuletzt/globals.dart' as globals;

class SettingsService {
  static void setGlobalsPersistent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('timerToggle', globals.toggleTimer);
    await prefs.setDouble('timerValue', globals.timerValue);
  }

  static void getGlobalsPersistent() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? timerToggle = prefs.getBool('timerToggle');
    final double? timerValue = prefs.getDouble('timerValue');

    if (timerValue == null || timerValue == 0) {
      globals.timerValue = 5;
    } else {
      globals.timerValue = timerValue!;
    }

    if (timerToggle == null || timerToggle == 0) {
      globals.toggleTimer = true;
    } else {
      globals.toggleTimer = timerToggle!;
    }
    ;
  }
}
