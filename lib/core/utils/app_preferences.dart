import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? sharedPreferences;

  static final String onBoarded = 'onBoarded';
  static final String loggedIn = 'loggedIn';

  static Future<void> instance() async {
    if (sharedPreferences != null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  static Future<void> setLoggedIn() async {
    await instance();
    await sharedPreferences?.setBool(loggedIn, false);
  }

  static Future<void> setOnBoarded() async {
    await instance();
    await sharedPreferences?.setBool(onBoarded, true);
  }

  static Future<bool> isLoggedIn() async {
    await instance();
    bool? isLoggedIn = sharedPreferences?.getBool(loggedIn);
    if (isLoggedIn != null && isLoggedIn) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isOnBoarded() async {
    await instance();
    bool? isOnBoarded = sharedPreferences?.getBool(onBoarded);
    if (isOnBoarded != null && isOnBoarded) {
      return true;
    } else {
      return false;
    }
  }
}
