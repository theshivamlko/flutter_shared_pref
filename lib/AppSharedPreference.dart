import 'package:shared_preferences/shared_preferences.dart';

/// For Shared Preference code re-use
class AppSharedPreference {
  static SharedPreferences sharedPreferences;

  AppSharedPreference() {
    getInstance();
  }

  void getInstance() async {
    if (sharedPreferences == null)
      sharedPreferences = await SharedPreferences.getInstance();
    // get instance of shared preference
  }

  /// to save key value in SharedPreference
  void saveData(String key, dynamic value) {
    if (value is String)
      sharedPreferences.setString(key, value); // to store String value only
    if (value is int)
      sharedPreferences.setInt(key, value); // to store Int value only
    if (value is bool)
      sharedPreferences.setBool(key, value); // to store Bool value only
  }

  dynamic getSaveData(String key) {
    return sharedPreferences.get(key); // to get dynamic value only on key basis
  }
}
